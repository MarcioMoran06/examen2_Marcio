class Book {
  final String id;
  final String title;
  final String description;
  final List<String> villains;

  Book(
      {required this.id,
      required this.title,
      required this.description,
      required this.villains});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      villains: List<String>.from(json['villains']),
    );
  }
}