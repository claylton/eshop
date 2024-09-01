class CartItemModel {
  String id;
  String title;
  int quantity;
  double price;
  String image;
  
  CartItemModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
  });
  

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }
}
