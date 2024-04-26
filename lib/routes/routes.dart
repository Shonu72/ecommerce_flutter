import 'package:ecommerce/core/utils/product_category.dart';
import 'package:ecommerce/screens/AuthScreens/login_screen.dart';
import 'package:ecommerce/screens/Navpages/category_page.dart';
import 'package:ecommerce/screens/Navpages/profile_page.dart';
import 'package:ecommerce/screens/Navpages/wish_list_page.dart';
import 'package:ecommerce/screens/bottom_nav_page.dart';
import 'package:ecommerce/screens/Navpages/home_screen.dart';
import 'package:ecommerce/screens/payment/payment_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String loginScreen = '/loginScreen';
  static String homeScreen = '/homeScreen';
  static String categoryScreen = '/categoryScreen';
  static String wishlistScreen = '/wishlistScreen';
  static String profileScreen = '/profileScreen';
  static String mainPage = '/mainPage';
  static String electric = '/electric';
  static String jewelery = '/jewelery';
  static String mens = '/mens';
  static String womens = '/womens';
  static String payments = '/payments';
}

final getPages = [
  GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
  GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
  GetPage(name: Routes.categoryScreen, page: () => CategoryPageScreen()),
  GetPage(name: Routes.wishlistScreen, page: () => const WishListPage()),
  GetPage(name: Routes.profileScreen, page: () => const ProfileScreen()),
  GetPage(name: Routes.mainPage, page: () => const MainPage()),
  GetPage(name: Routes.electric, page: () => ElectricCategory()),
  GetPage(name: Routes.jewelery, page: () => JeweleryCategory()),
  GetPage(name: Routes.mens, page: () => MensCategory()),
  GetPage(name: Routes.womens, page: () => WomensCategory()),
  GetPage(name: Routes.payments, page: () => const PaymentPage()),
];
