import 'package:exam_app/screen/auth/login_screen.dart';
import 'package:exam_app/screen/auth/signup_screen.dart';
import 'package:exam_app/screen/favourite/favourite_screen.dart';
import 'package:exam_app/screen/home/home_screen.dart';
import 'package:exam_app/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

class GetRoutes
{
  static String splash = "/splash";
  static String home = "/home";
  static String login = "/login";
  static String signup = "/signup";
  static String favourite = "/favourite";


  static List<GetPage> pages =
      [
        GetPage(
          name: splash,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: home,
          page: () =>   HomeScreen(),
        ),
        GetPage(
          name: login,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: signup,
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: favourite,
          page: () => const FavouriteScreen(),
        ),
      ];
}