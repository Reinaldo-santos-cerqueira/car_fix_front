import 'package:car_fix/model/client_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class ClientRepository {
  Future<http.Response>  create(ClientModel clientData, XFile imageFile);
}
