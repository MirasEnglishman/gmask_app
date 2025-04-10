import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _showError = false;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    if (_loginController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _showError = true;
      });
    } else {
      setState(() {
        _showError = false;
      });
         Routes.router.navigate(
                    Routes.homePage,
                    navigationType: NavigationType.push,
                  );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Вход в аккаунт",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Вход",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A2A43),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Добро пожаловать!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Логин",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                hintText: "Телефон или Email",
                hintStyle: const TextStyle(color: Colors.black38),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _showError ? Colors.red.shade300 : Colors.black12,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _showError ? Colors.red.shade300 : Colors.black26,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            if (_showError)
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "Проверьте корректность данных и попробуйте снова.",
                  style: TextStyle(color: Colors.red.shade400, fontSize: 12),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              "Пароль",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: "********",
                hintStyle: const TextStyle(color: Colors.black38),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _showError ? Colors.red.shade300 : Colors.black12,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _showError ? Colors.red.shade300 : Colors.black26,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _validateAndLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.additional ,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text("Войти", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  // Add forgot password logic
                },
                child: const Text(
                  "Забыли пароль?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 300,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    children: [
                      TextSpan(text: "Продолжая вы соглашаетесь с "),
                      TextSpan(
                        text: "Пользовательскими условиями",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Нет аккаунта? Создайте аккаунт,",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Text(
                    "чтобы иметь доступ к избранным услугам.",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                   SizedBox(
                    width: double.infinity,
                     child:ElevatedButton(
  onPressed: (){         Routes.router.navigate(
                    Routes.registrationScreen,
                    navigationType: NavigationType.push,
                  );},
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.white,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.grey.shade300, width: 1.0),
    ),
    elevation: 0,
  ),
  child: Text("Создать аккаунт", style: AppTextStyles.px16W600PrimaryText,)
),
                   ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}