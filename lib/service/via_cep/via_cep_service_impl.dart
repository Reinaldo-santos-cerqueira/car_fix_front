import 'package:car_fix/model/address_model.dart';
import 'package:car_fix/repository/via_cep/via_cep_repository.dart';
import 'package:car_fix/service/via_cep/via_cep_service.dart';

class ViaCepServiceImpl extends ViaCepService {
  final ViaCepRepository viaCepRepository;

  ViaCepServiceImpl({required this.viaCepRepository});

  @override
  Future<AddressModel?> getAddress(String cep) async {
    try {
      String cepWithoutPoint = cep.replaceAll(".", "");
      String cepFormated = cepWithoutPoint.replaceAll("-", "");
      if (cepFormated.length == 8) {
        Map<String, dynamic>? data = await viaCepRepository.getAddress(cep);
        if (data != null) {
          AddressModel addressModel = AddressModel(
            neighborhood: data["bairro"] ?? '',
            street: data["logradouro"] ?? '',
            cep: cep,
            state: data["uf"] ?? '',
            city: data["localidade"] ?? '',
            number: '',
            complement:''
          );
          return addressModel;
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
