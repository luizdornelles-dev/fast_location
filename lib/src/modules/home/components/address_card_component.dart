import 'package:flutter/material.dart';
import '../../../shared/colors/app_colors.dart';
import '../model/address_model.dart';

class AddressCardComponent extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onOpenMap;

  const AddressCardComponent({
    super.key,
    required this.address,
    required this.onOpenMap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.location_on, color: AppColors.primary, size: 40),
            const SizedBox(height: 16),

            const Text(
              "ENDEREÇO:",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              address.logradouro.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "BAIRRO:",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              address.bairro,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 16),

            const Text(
              "CIDADE/ESTADO:",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              "${address.localidade} - ${address.uf}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onOpenMap,
              icon: const Icon(Icons.map, color: Colors.black),
              label: const Text(
                "VER NO MAPA",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
