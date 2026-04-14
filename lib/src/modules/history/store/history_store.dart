import 'package:mobx/mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../shared/storage/app_storage.dart';
import '../../home/model/address_model.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStoreBase with _$HistoryStore;

abstract class _HistoryStoreBase with Store {
  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>();

  @action
  void loadHistory() {
    final box = Hive.box(AppStorage.historyBoxName);

    final List<AddressModel> loaded = box.values.map((item) {
      return AddressModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();

    addresses.clear();
    addresses.addAll(loaded);
  }
}
