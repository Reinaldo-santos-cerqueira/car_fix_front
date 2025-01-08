import 'dart:convert';
import 'package:car_fix/model/client_model.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:car_fix/repository/client/client_repository.dart';
import 'package:image_picker/image_picker.dart';

class ClientRepositoryImpl extends ClientRepository {
  @override
  Future<http.Response> create(ClientModel clientData, XFile imageFile) async {
    var uri = Uri.parse('$urlMain/authentication/signup/client');
    var request = http.MultipartRequest('POST', uri);

    request.fields['clientData'] = json.encode(clientData.toMap());

    var file = await http.MultipartFile.fromPath(
      'imageDocumentVehicle',
      imageFile.path,
      filename: imageFile.path.split('/').last,
    );

    request.files.add(file);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }
}
