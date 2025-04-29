class ServiceModel {
  final String id;
  final String description;
  final String title;
  final double priceService;
  final double priceKmTraveled;
  bool isSelected;

  ServiceModel({
    required this.id,
    required this.description,
    required this.title,
    required this.priceService,
    required this.priceKmTraveled,
    this.isSelected = false,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      priceService: (json['price_service'] as num).toDouble(),
      priceKmTraveled: (json['price_km_traveled'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'price_service': priceService,
      'price_km_traveled': priceKmTraveled,
    };
  }
}
