class ChatServiceModel {
  final String id;
  final DateTime createdAt;
  final String message;
  final String serviceRequestedId;
  final String senderId;
  final String receivedId;

  ChatServiceModel({
    required this.id,
    required this.createdAt,
    required this.message,
    required this.serviceRequestedId,
    required this.senderId,
    required this.receivedId,
  });

  factory ChatServiceModel.fromJson(Map<String, dynamic> json) {
    return ChatServiceModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      message: json['message'],
      serviceRequestedId: json['service_requested_id'],
      senderId: json['sender_id'],
      receivedId: json['received_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'message': message,
      'service_requested_id': serviceRequestedId,
      'sender_id': senderId,
      'received_id': receivedId,
    };
  }
}
