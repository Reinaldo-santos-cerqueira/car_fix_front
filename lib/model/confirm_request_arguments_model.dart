class ConfirmRequestArgumentsModel {
  final String serviceId;
  final double latitude;
  final double longitude;
  final String address;

  ConfirmRequestArgumentsModel({
    required this.serviceId,
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
