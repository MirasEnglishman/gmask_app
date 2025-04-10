import 'package:flutter/material.dart';
import 'package:gmask_app/routes.dart';
import 'package:gmask_app/service_locator.dart';
import 'package:gmask_app/utils/shared_preference.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routes.initRoutes();
  await initializeDateFormatting('ru_RU');
  await sharedPreference.init();
  await serviceLocatorSetup();
  runApp(const MyApp());
}
