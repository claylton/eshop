import 'dart:convert';

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



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tag': tag,
      'price': price,
      'description': description,
      'brand': brand,
      'images': images,
      'category': category.toMap(),
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      brand: map['brand'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      category: CategoryItemModel.fromMap(map['category'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromJson(String source) => ProductDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
