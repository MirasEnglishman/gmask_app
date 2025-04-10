import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/routes.dart';
import 'package:gmask_app/utils/shared_preference.dart';
import 'package:seafarer/seafarer.dart';
import 'package:gmask_app/core/app_colors.dart';


class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper = sharedPreference;

  @override
  void initState() {
    super.initState();
    _startInitialization();
  }

  Future<void> _startInitialization() async {
    // Задержка 1 секунда перед запуском инициализации
    await Future.delayed(const Duration(seconds: 1));
    await initialize();
  }

  Future<void> initialize() async {
    // Предполагается, что _sharedPreferenceHelper и Routes уже определены
    await _sharedPreferenceHelper.init();

    Routes.router.navigate(
      Routes.onboardingScreen,
      navigationType: NavigationType.pushReplace,
      transitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 400),
            Image.asset(AppAssets.imLogo, height: 50,),
            Spacer(),
            Image.asset(AppAssets.imLogos, height: 30,),
            const SizedBox(height: 30),
      
            
          ],
        ),
      ),
    );
  }
}
