import 'dart:convert';

class CategoryItemModel {
  String id;
  String title;
  String tag;

  CategoryItemModel({  
    required this.id,
    required this.title,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tag': tag,
    };
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItemModel.fromJson(String source) => CategoryItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
