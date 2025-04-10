import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/main/widgets/work_widget.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Logo
              Center(
                child: Image.asset(
                  AppAssets.imLogo, // Replace with your logo path
                  height: 40,
                ),
              ),
              const SizedBox(height: 20),
              // Welcome text
              const Center(
                child: Text(
                  "Добро пожаловать в мир автодетейлинга.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A2A43),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Управляй услугами, записывайся и контролируй все в одном месте.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Service cards
                 Stack(
                  children: [
                    // WorkWidget
                    const WorkWidget(),
                    // Gradient overlay - white to transparent
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 200, // Adjust the height of the gradient as needed
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              
              const Spacer(),
              // Login button
              ElevatedButton(
                onPressed: () {
                  Routes.router.navigate(
                    Routes.loginScreen,
                    navigationType: NavigationType.push,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2A43),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text("Войти в аккаунт", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              // Services button
              TextButton(
                onPressed: () {
                  Routes.router.navigate(
                    Routes.homePage,
                    navigationType: NavigationType.push,
                  );
                },
                child: const Text(
                  "Перейти к услугам",
                  style: TextStyle(
                    color: Color(0xFF1A2A43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
