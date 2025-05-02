import 'dart:convert';
import 'package:car_fix/model/client_model.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:car_fix/repository/client/client_repository.dart';
import 'package:image_picker/image_picker.dart';

class ClientRepositoryImpl implements ClientRepository {
  @override
  Future<http.Response> create(ClientModel clientData, XFile imageDocumentVehicle,  XFile imageProfile) async {
    var uri = Uri.parse('$urlMain/users/client');
    var request = http.MultipartRequest('POST', uri);

    request.fields['data'] = json.encode(clientData.toJson());

    var fileImageDocumentVehicle = await http.MultipartFile.fromPath(
      'imageDocumentVehicle',
      imageDocumentVehicle.path,
      filename: imageDocumentVehicle.path.split('/').last,
    );

    request.files.add(fileImageDocumentVehicle);

    var fileImageProfile = await http.MultipartFile.fromPath(
      'imageProfile',
      imageProfile.path,
      filename: imageProfile.path.split('/').last,
    );

    request.files.add(fileImageProfile);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }
}
