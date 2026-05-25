class FoodModel {
  final String id;
  final String name;
  final String imagePath;
  final String weight;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final String ingredients;
  final int price; // ممكن تضيف سعر لو حابب
  bool isFavorite;

  FoodModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.weight,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredients,
    required this.price,
    this.isFavorite = false,
  });
}