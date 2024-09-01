import 'dart:convert';

class ProductItemModel {
  String id;
  String item;
  String brand;
  String tag;
  double price;
  String imagem;

  ProductItemModel({
    required this.id,
    required this.item,
    required this.brand,
    required this.tag,
    required this.price,
    required this.imagem,
  });

  Map<String, dynamic> _toMap() {
    return <String, dynamic>{
      'id': id,
      'item': item,
      'brand': brand,
      'tag': tag,
      'price': price,
      'imagem': imagem,
    };
  }

  factory ProductItemModel._fromMap(Map<String, dynamic> map) {
    return ProductItemModel(
      id: map['id'] as String,
      item: map['item'] as String,
      brand: map['brand'] as String,
      tag: map['tag'] as String,
      price: map['price'] as double,
      imagem: map['imagem'] as String,
    );
  }

  String toJson() => json.encode(_toMap());

  factory ProductItemModel.fromJson(String source) => ProductItemModel._fromMap(json.decode(source) as Map<String, dynamic>);
}
