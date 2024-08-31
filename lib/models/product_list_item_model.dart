import 'dart:convert';

class ProductListItemModel {
  String id;
  String item;
  String brand;
  String tag;
  double price;
  String imagem;

  ProductListItemModel({
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

  factory ProductListItemModel._fromMap(Map<String, dynamic> map) {
    return ProductListItemModel(
      id: map['id'] as String,
      item: map['item'] as String,
      brand: map['brand'] as String,
      tag: map['tag'] as String,
      price: map['price'] as double,
      imagem: map['imagem'] as String,
    );
  }

  String toJson() => json.encode(_toMap());

  factory ProductListItemModel.fromJson(String source) => ProductListItemModel._fromMap(json.decode(source) as Map<String, dynamic>);
}
