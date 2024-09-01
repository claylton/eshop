class ProductItemModel {
  String id;
  String title;
  String brand;
  String tag;
  double price;
  String image;

  ProductItemModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.tag,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'brand': brand,
      'tag': tag,
      'price': price,
      'image': image,
    };
  }

  factory ProductItemModel.fromJson(Map<String, dynamic> map) {
    return ProductItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      brand: map['brand'] as String,
      tag: map['tag'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }
}
