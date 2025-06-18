class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String category;
  final bool isFeatured;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.category,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      category: json['category'],
      imageUrl: json['imageUrl'],
      githubUrl: json['githubUrl'],
      liveUrl: json['liveUrl'],
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'technologies': technologies,
      'category': category,
      'imageUrl': imageUrl,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'isFeatured': isFeatured,
    };
  }
}
