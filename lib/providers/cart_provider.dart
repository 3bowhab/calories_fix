import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calories_fix/models/cart_item.dart';
import 'package:calories_fix/models/food_model.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/meals_lists.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<CartItem> _items = [];
  List<CartItem> get items => _items;
  StreamSubscription? _cartSubscription;

  // ميثود لجلب الـ UID الحالي للمستخدم من FirebaseAuth
  String get _currentUserId => _auth.currentUser?.uid ?? '';

  // 1. الاستماع للسلة بشكل لحظي (Stream)
  // نادي على الميثود دي في أول شاشة بعد تسجيل الدخول
  // 1. تعديل ميثود الـ Listener لإضافة معالج أخطاء
  void startCartListener() {
    // نلغي أي اشتراك قديم لتجنب التكرار والتعارض
    _cartSubscription?.cancel();

    if (_currentUserId.isEmpty) return;

    _cartSubscription = _firestore
        .collection('user')
        .doc(_currentUserId)
        .collection('cart')
        .snapshots()
        .listen(
          (snapshot) {
            _items = snapshot.docs.map((doc) {
              return CartItem(
                productId: doc.id,
                quantity: doc.data()['quantity'] ?? 1,
              );
            }).toList();
            notifyListeners();
          },
          // السطر ده هو الحل: بيمتص خطأ الصلاحيات وقت الـ Logout
          onError: (error) {
            debugPrint("Cart stream closed: $error");
            // هنا ممكن تنادي على clearData لو عايز تنظف السلة وقت الخطأ
            _items.clear();
            notifyListeners();
          },
        );
  }

  // 2. تحديث ميثود تنظيف البيانات
  void clearData() {
    _cartSubscription?.cancel(); // قفل خط الاتصال فوراً
    _cartSubscription = null; // تصفير المتغير
    _items.clear(); // مسح البيانات المحلية
    notifyListeners();
  }

  // 2. إضافة وجبة أو إظهار رسالة إذا كانت موجودة
  // داخل ملف CartProvider.dart
  Future<bool> addToCart(String mealId, int quantity) async {
    // أضف متغير الكمية هنا
    final cartDoc = _firestore
        .collection('user')
        .doc(_currentUserId)
        .collection('cart')
        .doc(mealId);

    final docSnapshot = await cartDoc.get();

    if (docSnapshot.exists) {
      return false;
    } else {
      await cartDoc.set({
        'productId': mealId,
        'quantity': quantity, // استخدم المتغير المرسل بدلاً من رقم 1
        'addedAt': FieldValue.serverTimestamp(),
      });
      return true;
    }
  }

  // 3. تحديث الكمية في الفايربيز
  Future<void> updateQuantity(int index, bool isIncrement) async {
    final item = _items[index];
    int newQuantity = isIncrement ? item.quantity + 1 : item.quantity - 1;

    if (newQuantity > 0) {
      await _firestore
          .collection('user')
          .doc(_currentUserId)
          .collection('cart')
          .doc(item.productId)
          .update({'quantity': newQuantity});
    }
  }

  // 4. حذف الوجبة نهائياً من حساب المستخدم
  Future<void> removeItem(String productId) async {
    await _firestore
        .collection('user')
        .doc(_currentUserId)
        .collection('cart')
        .doc(productId)
        .delete();
  }

  // 5. جلب بيانات الوجبة المترجمة للـ UI
  FoodModel getMealById(BuildContext context, String id) {
    final allMeals = [
      ...MealsLists.breakfastMeals(context),
      ...MealsLists.saladsMeals(context),
      ...MealsLists.mainMeals(context),
    ];

    return allMeals.firstWhere(
      (meal) => meal.id == id,
      orElse: () => FoodModel(
        id: 'unknown',
        name: 'Unknown',
        imagePath: '',
        weight: '',
        calories: 0,
        protein: 0,
        carbs: 0,
        fat: 0,
        ingredients: '',
        price: 0,
      ),
    );
  }

  // 6. حساب الإجمالي
  double getTotalAmount(BuildContext context) {
    double total = 0.0;
    for (var item in _items) {
      final mealData = getMealById(context, item.productId);
      total += (mealData.price * item.quantity);
    }
    return total;
  }
}
