import 'package:flutter/widgets.dart';

class ServiceModel {
  final String id;
  final String description;
  final String title;
  final TextEditingController? textEditingControllerPriceService;
  final TextEditingController? textEditingControllerPriceTraveled;
  bool isSelected;
  GlobalKey<FormState>? formKey;

  ServiceModel({
    required this.id,
    required this.description,
    required this.title,
    TextEditingController? textEditingControllerPriceService,
    TextEditingController? textEditingControllerPriceTraveled,
    this.isSelected = false,
    GlobalKey<FormState>? formKey,
  })  : formKey = formKey ?? GlobalKey<FormState>(),
        textEditingControllerPriceService =
            textEditingControllerPriceService ?? TextEditingController(),
        textEditingControllerPriceTraveled =
            textEditingControllerPriceTraveled ?? TextEditingController();

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'priceService': double.parse(textEditingControllerPriceService!.text),
      'priceKmTraveled': double.parse(textEditingControllerPriceTraveled!.text),
    };
  }

  ServiceModelApiServiceProvider getServiceSendApi() {
    return ServiceModelApiServiceProvider(
      serviceId: id,
      priceService: double.parse(textEditingControllerPriceService!.text),
      priceKmTraveled: double.parse(textEditingControllerPriceTraveled!.text),
    );
  }
}

class ServiceModelApiServiceProvider {
  final String serviceId;
  final double priceService;
  final double priceKmTraveled;
  ServiceModelApiServiceProvider({
    required this.serviceId,
    required this.priceService,
    required this.priceKmTraveled,
  });
}
