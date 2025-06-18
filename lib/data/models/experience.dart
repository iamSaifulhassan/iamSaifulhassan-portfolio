class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final List<String> achievements;
  final String? logoUrl;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required this.achievements,
    this.logoUrl,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'],
      position: json['position'],
      duration: json['duration'],
      description: json['description'],
      achievements: List<String>.from(json['achievements']),
      logoUrl: json['logoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'position': position,
      'duration': duration,
      'description': description,
      'achievements': achievements,
      'logoUrl': logoUrl,
    };
  }
}
