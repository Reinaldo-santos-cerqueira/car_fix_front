import 'package:car_fix/model/service_provider_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class ServiceProviderRepository {
  Future<http.Response>  create(ServiceProviderModel clientData, XFile imageFileCnh,  XFile imageFileDocumentVehicle,XFile imageFileProfile);
}
