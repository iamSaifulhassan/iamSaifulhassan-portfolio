class Project {
  final String title;
  final String description;
  final String longDescription;
  final List<String> technologies;
  final List<String> features;
  final String? imageUrl;
  final List<String> screenshots;
  final String? youtubeVideoId;
  final String? downloadUrl;
  final String? liveUrl;
  final String category;
  final bool isFeatured;
  final String fit;

  Project({
    required this.title,
    required this.description,
    required this.category,
    this.longDescription = '',
    this.imageUrl,
    this.technologies = const [],
    this.features = const [],
    this.screenshots = const [],
    this.youtubeVideoId,
    this.downloadUrl,
    this.liveUrl,
    this.isFeatured = false,
    this.fit = 'cover',
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
      longDescription: json['longDescription'] ?? json['description'],
      technologies: json['technologies'] != null
          ? List<String>.from(json['technologies'])
          : [],
      features:
          json['features'] != null ? List<String>.from(json['features']) : [],
      screenshots: json['screenshots'] != null
          ? List<String>.from(json['screenshots'])
          : [],
      category: json['category'],
      imageUrl: json['imageUrl'],
      youtubeVideoId: json['youtubeVideoId'],
      downloadUrl: json['downloadUrl'],
      liveUrl: json['liveUrl'],
      isFeatured: json['isFeatured'] ?? false,
      fit: json['fit'] ?? 'cover',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'longDescription': longDescription,
      'technologies': technologies,
      'features': features,
      'screenshots': screenshots,
      'category': category,
      'imageUrl': imageUrl,
      'youtubeVideoId': youtubeVideoId,
      'downloadUrl': downloadUrl,
      'liveUrl': liveUrl,
      'isFeatured': isFeatured,
      'fit': fit,
    };
  }
}
