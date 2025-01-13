import 'dart:convert';
import 'package:car_fix/model/service_provider_model.dart';
import 'package:car_fix/repository/service_provider/service_provider_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  @override
  Future<http.Response> create(ServiceProviderModel clientData,
      XFile imageFileCnh, XFile imageFileDocumentVehicle) async {
    var uri = Uri.parse('$urlMain/authentication/signup/service_provider');
    var request = http.MultipartRequest('POST', uri);

    request.fields['serviceProviderData'] = jsonEncode(clientData.toJson());  
    
    print(json.encode(clientData.toJson()));
    
    var fileDocumentVehicle = await http.MultipartFile.fromPath(
      'imageDocumentVehicle',
      imageFileDocumentVehicle.path,
      filename: imageFileDocumentVehicle.path.split('/').last,
    );
    request.files.add(fileDocumentVehicle);

    var fileCnh = await http.MultipartFile.fromPath(
      'imageCnh',
      imageFileCnh.path,
      filename: imageFileDocumentVehicle.path.split('/').last,
    );

    request.files.add(fileCnh);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }
}
