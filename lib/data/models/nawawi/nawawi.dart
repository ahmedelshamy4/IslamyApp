class Nawawi {
  final String title;
  final String description;
  final String hadith;

  Nawawi({
    required this.title,
    required this.description,
    required this.hadith,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'hadith': hadith,
    };
  }

  factory Nawawi.fromJson(Map<String, dynamic> json) {
    return Nawawi(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      hadith: json['hadith'] ?? '',
    );
  }
}
