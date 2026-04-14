import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../shared/colors/app_colors.dart';
import '../store/home_store.dart';
import '../repositories/address_repository.dart';
import '../service/address_service.dart';
import '../../../http/dio_client.dart';

import '../components/address_card_component.dart';
import '../components/empty_address_component.dart';

import '../../../shared/components/custom_primary_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore controller;
  final TextEditingController _cepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = HomeStore(AddressService(AddressRepository(DioClient())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'FastLocation',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2,
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  labelText: 'Digite o CEP para entrega',
                  labelStyle: TextStyle(color: AppColors.primary, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              CustomPrimaryButton(
                label: 'LOCALIZAR ENDEREÇO',
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  String cepDigitado = _cepController.text.replaceAll(
                    RegExp(r'[^0-9]'),
                    '',
                  );

                  if (cepDigitado.length != 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "⚠️ O CEP deve conter exatamente 8 números.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: AppColors.error,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return;
                  }

                  controller.fetchAddress(cepDigitado);
                },
              ),

              const SizedBox(height: 30),

              Observer(
                builder: (_) {
                  if (controller.isLoading) {
                    return const CircularProgressIndicator(
                      color: AppColors.primary,
                    );
                  }

                  if (controller.address != null) {
                    if (controller.address!.logradouro.isEmpty &&
                        controller.address!.localidade.isEmpty) {
                      return const EmptyAddressComponent();
                    }

                    return AddressCardComponent(
                      address: controller.address!,
                      onOpenMap: () async {
                        if (controller.lat != 0.0 && controller.lng != 0.0) {
                          await controller.openMap();
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Coordenadas não encontradas para este endereço.",
                                ),
                                backgroundColor: AppColors.error,
                              ),
                            );
                          }
                        }
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
