class Education {
  final String institution;
  final String degree;
  final String field;
  final String duration;
  final String? grade;
  final String? description;
  final String? logoUrl;

  Education({
    required this.institution,
    required this.degree,
    required this.field,
    required this.duration,
    this.grade,
    this.description,
    this.logoUrl,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'],
      degree: json['degree'],
      field: json['field'],
      duration: json['duration'],
      grade: json['grade'],
      description: json['description'],
      logoUrl: json['logoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institution': institution,
      'degree': degree,
      'field': field,
      'duration': duration,
      'grade': grade,
      'description': description,
      'logoUrl': logoUrl,
    };
  }
}
