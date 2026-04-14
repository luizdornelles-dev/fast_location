import 'package:flutter/material.dart';
import '../../../shared/colors/app_colors.dart';

class EmptyAddressComponent extends StatelessWidget {
  const EmptyAddressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "⚠️ CEP não encontrado.\nPor favor, verifique o número digitado.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.error,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
