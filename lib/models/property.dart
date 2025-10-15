// Model untuk properti yang bisa disewa
class Property {
  final String id;
  final String name;
  final String description;
  final PropertyCategory category;
  final double price;
  final String priceUnit; // per hour, per day, per event
  final String location;
  final List<String> images;
  final List<String> facilities;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final String owner;
  final Map<String, dynamic> additionalInfo;

  Property({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.priceUnit,
    required this.location,
    required this.images,
    required this.facilities,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.owner,
    this.additionalInfo = const {},
  });

  // Format harga untuk ditampilkan
  String get formattedPrice {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}/$priceUnit';
  }

  // Copy dengan perubahan
  Property copyWith({
    String? id,
    String? name,
    String? description,
    PropertyCategory? category,
    double? price,
    String? priceUnit,
    String? location,
    List<String>? images,
    List<String>? facilities,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    String? owner,
    Map<String, dynamic>? additionalInfo,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      priceUnit: priceUnit ?? this.priceUnit,
      location: location ?? this.location,
      images: images ?? this.images,
      facilities: facilities ?? this.facilities,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      owner: owner ?? this.owner,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }
}

// Enum untuk kategori properti
enum PropertyCategory {
  sportsField('Lapangan Olahraga', '🏟️'),
  villa('Villa', '🏖️'),
  eventSpace('Ruang Acara', '🎉'),
  meetingRoom('Ruang Meeting', '💼'),
  parking('Parkir', '🅿️'),
  studio('Studio', '🎬'),
  warehouse('Gudang', '🏭');

  const PropertyCategory(this.displayName, this.emoji);
  
  final String displayName;
  final String emoji;
}
