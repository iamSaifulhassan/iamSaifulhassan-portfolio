class Skill {
  final String name;
  final String iconPath;
  final double proficiency;
  final String category;
  final String description;

  Skill({
    required this.name,
    required this.iconPath,
    required this.proficiency,
    required this.category,
    required this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'],
      iconPath: json['iconPath'],
      proficiency: json['proficiency'].toDouble(),
      category: json['category'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconPath': iconPath,
      'proficiency': proficiency,
      'category': category,
      'description': description,
    };
  }
}
