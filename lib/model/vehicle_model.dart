class VehicleModel {
  String? plate;
  String? color;
  String? model;
  String? mark;

  VehicleModel({this.plate, this.color, this.model, this.mark});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    plate = json['plate'];
    color = json['color'];
    model = json['model'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plate'] = plate;
    data['color'] = color;
    data['model'] = model;
    data['mark'] = mark;
    return data;
  }
}