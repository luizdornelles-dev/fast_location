import '../model/address_model.dart';
import '../repositories/address_repository.dart';

class AddressService {
  final AddressRepository _repository;

  AddressService(this._repository);


  Future<AddressModel> getAddress(String cep) async {

    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');


    return await _repository.getAddress(cleanCep);
  }
}
