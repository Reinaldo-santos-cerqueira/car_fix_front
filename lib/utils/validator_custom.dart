import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:validatorless/cnpj.dart';

String? validateCPFouCNPJ(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }

  if (!CPFValidator.isValid(value) && !CNPJValidator.isValid(value)) {
    return 'CPF ou CNPJ inválido';
  }

  return null;
}

String? validateCep(String? value) {
  if (value != null) {
    String valueWithoutPoint = value.replaceAll(".", "");
    String valueFormated = valueWithoutPoint.replaceAll("-", "");
    if (valueFormated.length == 8) {
      return null;
    }
    return "Digite um cep valido";
  }
  return "Digite um cep valido";
}
