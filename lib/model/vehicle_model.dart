class VehicleModel {
  final String model;
  final String mark;
  final String plate;
  final String color;
  final String pathToDocument;
  final String? id;

  VehicleModel(
    this.id, {
    required this.model,
    required this.mark,
    required this.plate,
    required this.color,
    required this.pathToDocument,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      json['id'],
      model: json['model'] ?? "",
      mark: json['mark'] ?? "",
      plate: json['plate'] ?? "",
      color: json['color'] ?? "",
      pathToDocument: json['path_to_document'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'mark': mark,
      'plate': plate,
      'color': color,
      'path_to_document': pathToDocument,
    };
  }
}
