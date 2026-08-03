class PractitionerModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String location;
  final String languages;
  final List<String> tags;
  final double pricePerSession;
  final String experience;
  final bool isVerified;
  final bool isPopular;
  
  // New fields for search results
  final int reviewsCount;
  final String availabilityText;
  final bool isAvailableToday;

  PractitionerModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.languages,
    required this.tags,
    required this.pricePerSession,
    this.experience = '',
    this.isVerified = true,
    this.isPopular = false,
    this.reviewsCount = 0,
    this.availabilityText = '',
    this.isAvailableToday = false,
  });

  factory PractitionerModel.fromJson(Map<String, dynamic> json) {
    return PractitionerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      location: json['location'] ?? '',
      languages: json['languages'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      pricePerSession: (json['pricePerSession'] ?? 0.0).toDouble(),
      experience: json['experience'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isPopular: json['isPopular'] ?? false,
      reviewsCount: json['reviewsCount'] ?? 0,
      availabilityText: json['availabilityText'] ?? '',
      isAvailableToday: json['isAvailableToday'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'location': location,
      'languages': languages,
      'tags': tags,
      'pricePerSession': pricePerSession,
      'experience': experience,
      'isVerified': isVerified,
      'isPopular': isPopular,
      'reviewsCount': reviewsCount,
      'availabilityText': availabilityText,
      'isAvailableToday': isAvailableToday,
    };
  }
}
