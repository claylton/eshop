import 'package:shopping_bloc/models/category_item_model.dart';

class ProductDetailsModel {
  String id;
  String title;
  String tag;
  double price;
  String description;
  String brand;
  List<String> images;
  CategoryItemModel category;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.tag,
    required this.price,
    required this.description,
    required this.brand,
    required this.images,
    required this.category,
  });



  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tag': tag,
      'price': price,
      'description': description,
      'brand': brand,
      'images': images,
      'category': category.toJson(),
    };
  }

  factory ProductDetailsModel.fromJson(Map<String, dynamic> map) {
    return ProductDetailsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      brand: map['brand'] as String,
      //!Converte tipo List<String> para List<dynamic>
      images: map['images'].cast<String>(),
      category: CategoryItemModel.fromJson(map['category'] as Map<String,dynamic>),
    );
  }
}
