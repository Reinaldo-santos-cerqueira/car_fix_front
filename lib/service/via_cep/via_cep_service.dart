import 'package:car_fix/model/address_model.dart';

abstract class ViaCepService {
  Future<AddressModel?> getAddress(String cep);
}