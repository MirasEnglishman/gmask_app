
import 'package:gmask_app/presentation/screens/auth/login_screen.dart';
import 'package:gmask_app/presentation/screens/auth/registration_screen.dart';
import 'package:gmask_app/presentation/screens/category/category_screen.dart';
import 'package:gmask_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:gmask_app/presentation/screens/home/home_screen.dart';
import 'package:gmask_app/presentation/screens/main/work_detail_screen.dart';
import 'package:gmask_app/presentation/screens/market/product_detail_screen.dart';
import 'package:gmask_app/presentation/screens/news/news_detail_screen.dart';
import 'package:gmask_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:gmask_app/presentation/screens/story/story_slider.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  Routes._();

  static final router = Seafarer(
    options: const SeafarerOptions(
      defaultTransitionDuration: Duration(milliseconds: 100),
    ),
  );

  static initRoutes() {
    router.addRoutes([
      SeafarerRoute(
        name: homePage,
        builder: (context, args, params) => HomePage(),
      ),

      SeafarerRoute(
        name: newsDetailScreen,
        builder: (context, args, params) => NewsDetailScreen(),
      ),

      SeafarerRoute(
        name: favoriteScreen,
        builder: (context, args, params) => FavoriteScreen(),
      ),

      SeafarerRoute(
        name: productDetailScreen,
        builder: (context, args, params) => ProductDetailScreen(),
      ),

      SeafarerRoute(
        name: workDetailScreen,
        builder: (context, args, params) => WorkDetailScreen(),
      ),

      SeafarerRoute(
        name: categoryScreen,
        builder: (context, args, params) => CategoryScreen(),
      ),

      SeafarerRoute(
        name: storySlider,
        builder: (context, args, params) => StandaloneStoriesSlider(),
      ),

      SeafarerRoute(
        name: onboardingScreen,
        builder: (context, args, params) => OnboardingScreen(),
      ),

      SeafarerRoute(
        name: loginScreen,
        builder: (context, args, params) => LoginScreen(),
      ),

      SeafarerRoute(
        name: registrationScreen,
        builder: (context, args, params) => RegistrationScreen(),
      ),
    ]);
  }
  static const String homePage = '/home_page';
  static const String newsDetailScreen = '/news_detail_screen';
  static const String favoriteScreen = '/favorite_screen';
  static const String productDetailScreen = '/product_detail_screen';
  static const String workDetailScreen =  '/work_detail_screen';
  static const String categoryScreen = '/category_screen';
  static const String storySlider = '/story_slider';
  static const String onboardingScreen = '/onboarding_screen';
  static const String loginScreen = '/login_screen';
  static const String registrationScreen = '/registration_screen';


}
