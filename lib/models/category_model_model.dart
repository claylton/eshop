import 'dart:convert';

class CategoryModel {
  String id;
  String title;
  String tag;

  CategoryModel({  
    required this.id,
    required this.title,
    required this.tag,
  });

  Map<String, dynamic> _toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tag': tag,
    };
  }

  factory CategoryModel._fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(_toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel._fromMap(json.decode(source) as Map<String, dynamic>);
}
