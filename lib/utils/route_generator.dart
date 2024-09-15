// import 'package:flutter/material.dart';
// import 'package:new_bar_abierto/screens/home_screen/home_screen.dart';
// import 'package:new_bar_abierto/screens/shopping_cart/shopping_cart_page.dart';

// import '../screens/category_list/category_list.dart';
// import '../screens/login_screen/login_page.dart';
// import '../screens/splash_screen/splash_screen.dart';

// class RouteGenerator {
//   static Route<dynamic> _returnRoute(RouteSettings settings, Widget page) {
//     return MaterialPageRoute(
//         builder: (context) {
//           return page;
//         },
//         settings: settings);
//   }

//   static Route<dynamic> _returnCustomRoute(Widget page) {
//     return MaterialPageRoute(builder: (context) => page);
//   }

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     Map args = {};
//     if (settings.arguments != null) {
//       args = settings.arguments as Map;
//     }
//     Widget page;

//     switch (settings.name) {
//       case "/":
//         page = const SplashScreen();
//         break;
//       case "/login":
//         return _returnCustomRoute(const LoginPage());
//       case "/home":
//         return _returnCustomRoute(const Home());
//       case "/productListPage":
//         return _returnCustomRoute(CategoryList(args["category"]));
//       case "/shoppingCart":
//         return _returnCustomRoute(const ShoppingCart());
//       default:
//         page = const SplashScreen();
//     }
//     return _returnRoute(settings, page);
//   }
// }
