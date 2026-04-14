import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class AppStorage {
  static const String historyBoxName = 'address_history';

  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(directory.path);

    await Hive.openBox(historyBoxName);
  }
}
