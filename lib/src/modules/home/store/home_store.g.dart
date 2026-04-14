// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_HomeStoreBase.address', context: context);

  @override
  AddressModel? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AddressModel? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$fetchAddressAsyncAction =
      AsyncAction('_HomeStoreBase.fetchAddress', context: context);

  @override
  Future<void> fetchAddress(String cep) {
    return _$fetchAddressAsyncAction.run(() => super.fetchAddress(cep));
  }

  late final _$openMapAsyncAction =
      AsyncAction('_HomeStoreBase.openMap', context: context);

  @override
  Future<void> openMap() {
    return _$openMapAsyncAction.run(() => super.openMap());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
address: ${address}
    ''';
  }
}
