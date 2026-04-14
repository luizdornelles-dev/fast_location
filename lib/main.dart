import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/splash_page.dart';
import 'src/shared/storage/app_storage.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppStorage.init();

  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => const SplashPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.history: (context) => const HistoryPage(),
      },
    );
  }
}
