class CategoryItemModel {
  String id;
  String title;
  String tag;

  CategoryItemModel({  
    required this.id,
    required this.title,
    required this.tag,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tag': tag,
    };
  }

  factory CategoryItemModel.fromJson(Map<String, dynamic> map) {
    return CategoryItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tag: map['tag'] as String,
    );
  }
}
