import '../../../http/dio_client.dart';
import '../model/address_model.dart';

class AddressRepository {
  final DioClient _client;

  AddressRepository(this._client);

  Future<AddressModel> getAddress(String cep) async {
    try {
      final response = await _client.dio.get('/$cep/json');
      return AddressModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar CEP');
    }
  }
}
