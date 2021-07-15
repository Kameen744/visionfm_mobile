class CategoryClass {
  final int id;
  final String name;
  final String slug;

  CategoryClass.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? '',
        slug = jsonMap['slug'] ?? '';
}
