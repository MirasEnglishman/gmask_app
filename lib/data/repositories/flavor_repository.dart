import 'package:injectable/injectable.dart';
import 'package:gmask_app/utils/shared_preference.dart';

@injectable
class FlavorRepository {
  String flavor = sharedPreference.flavor;

  void toggleFlavor() {
    flavor = flavor == 'dev' ? 'prod' : 'dev';
    sharedPreference.setFlavor(flavor);
  }
}
