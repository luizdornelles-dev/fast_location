import 'package:hive_flutter/hive_flutter.dart';
import '../../../shared/storage/app_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';
import '../model/address_model.dart';
import '../service/address_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AddressService _service;

  _HomeStoreBase(this._service);

  @observable
  bool isLoading = false;

  @observable
  AddressModel? address;

  double lat = 0.0;
  double lng = 0.0;

  @action
  Future<void> fetchAddress(String cep) async {
    isLoading = true;
    try {
      address = await _service.getAddress(cep);

      if (address != null && address!.logradouro.isNotEmpty) {
        final box = Hive.box(AppStorage.historyBoxName);
        box.put(address!.cep, address!.toJson());

        String enderecoCompleto =
            "${address!.logradouro}, ${address!.localidade}, ${address!.uf}";

        List<Location> locations = await locationFromAddress(enderecoCompleto);

        if (locations.isNotEmpty) {
          lat = locations.first.latitude;
          lng = locations.first.longitude;
        }
      }
    } catch (e) {
      address = null;
      lat = 0.0;
      lng = 0.0;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> openMap() async {
    if (lat != 0.0 && lng != 0.0) {
      try {
        final availableMaps = await MapLauncher.installedMaps;

        if (availableMaps.isNotEmpty) {
          await availableMaps.first.showMarker(
            coords: Coords(lat, lng),
            title: "Destino da Entrega",
            description: "${address?.logradouro}, ${address?.bairro}",
          );
        }
      } catch (e) {
        print("Erro ao abrir o mapa: $e");
      }
    }
  }
}
