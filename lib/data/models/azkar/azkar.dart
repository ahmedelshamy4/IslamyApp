class Azkar {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;

  Azkar({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  @override
  String toString() {
    return 'Azkar(category: $category, count: $count, description: $description, reference: $reference, zekr: $zekr';
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'zekr': zekr,
    };
  }

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      category: json['category'] ?? '',
      count: json['count'] ?? '',
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      zekr: json['zekr'] ?? '',
    );
  }
}
