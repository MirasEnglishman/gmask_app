import 'package:injectable/injectable.dart';
import 'package:gmask_app/core/env.dart';
import 'package:gmask_app/data/repositories/flavor_repository.dart';

import '../../service_locator.dart';

abstract class BaseFlavor {
  String get baseApiUrl;

  bool get enableAnalytics;

  bool get enableLogging;

  String get name;
}

class Flavor implements BaseFlavor {
  @override
  final String baseApiUrl;
  @override
  final bool enableAnalytics;
  @override
  final bool enableLogging;
  @override
  final String name;

  Flavor({
    required this.baseApiUrl,
    this.enableAnalytics = false,
    this.enableLogging = false,
    required this.name,
  });
}

@Injectable(as: Flavor)
class ProdFlavor extends Flavor {
  ProdFlavor()
      : super(
          name: 'PROD',
          baseApiUrl: serviceLocator<FlavorRepository>().flavor == 'dev'
              ? restDevURL
              : restURL,
          enableLogging: true,
          enableAnalytics: true,
        );
}
