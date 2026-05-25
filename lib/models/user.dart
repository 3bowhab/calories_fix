class UserModel {
  static const String collectionName = 'user';
  final String uid;
  final String? name;
  final String email;
  final String? phone;
  final String? address;
  final String? deliveryInstructions;
  

  UserModel({this.name, required this.email, required this.uid, this.phone, this.address, this.deliveryInstructions});

  UserModel.fromJson(Map<String, Object?> json)
    : this(
        name: json['name'] as String?,
        email: json['email']! as String,
        uid: json['uid']! as String,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        deliveryInstructions: json['deliveryInstructions'] as String?,
      );

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'phone': phone,
      'address': address,
      'deliveryInstructions': deliveryInstructions,
    };
  }
}