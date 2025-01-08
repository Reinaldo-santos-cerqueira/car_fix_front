abstract class ViaCepRepository {
  Future<Map<String, dynamic>?> getAddress(String cep);
}