import 'package:flutter/material.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Твоя машина заслуживает лучшего!',
      description: 'Премиальный детейлинг: блеск, защита и безупречный стиль.',
      imagePath: 'assets/images/detailing.png',
      buttonText: 'Далее',
    ),
    OnboardingPage(
      title: 'Новая жизнь авто',
      description: 'От химчистки до бронирования — все в одном месте.',
      imagePath: 'assets/images/ppf.png',
      buttonText: 'Далее',
    ),
    OnboardingPage(
      title: 'Царапина? Не было.',
      description: 'Восстановим внешний вид без следов.',
      imagePath: 'assets/images/scratch_repair.png',
      buttonText: 'Далее',
    ),
    OnboardingPage(
      title: 'Царапина? Не было.',
      description: 'Мы аккуратно устраним повреждения и вернем кузову идеальный вид — быстро и без лишних хлопот.',
      imagePath: 'assets/images/polishing.png',
      buttonText: 'Войти в аккаунт',
      secondaryButtonText: 'Перейти к услугам',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  // Добавлена функция для перехода к последнему экрану
  void _skipToLastPage() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(_pages[index]);
            },
          ),
          
          // Dot indicators
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          
          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Обработка нажатия "Пропустить" - переход к последнему экрану
                _skipToLastPage();
              },
              child: const Text(
                'Пропустить',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  page.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  page.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                if (page.secondaryButtonText != null)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Routes.router.navigate(
                    Routes.homePage,
                    navigationType: NavigationType.push,
                  );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(page.secondaryButtonText!),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                               Routes.router.navigate(
                    Routes.loginScreen,
                    navigationType: NavigationType.push,
                  );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentPage == _pages.length - 1 && page.secondaryButtonText != null 
                          ? Colors.transparent
                          : Colors.white,
                      foregroundColor: _currentPage == _pages.length - 1 && page.secondaryButtonText != null 
                          ? Colors.white
                          : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: _currentPage == _pages.length - 1 && page.secondaryButtonText != null 
                              ? Colors.white
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(page.buttonText),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final String? secondaryButtonText;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    this.secondaryButtonText,
  });
}