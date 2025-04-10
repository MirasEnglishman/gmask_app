import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 30,
    errorMethodCount: 5,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
