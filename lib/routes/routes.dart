import 'package:flutter/material.dart';

import '../screens/screens.dart';

// Route navigateTo(Widget screen) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => screen,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

class AppRoutes {
  static const initialRoute = "login";

  static Map<String, Widget Function(BuildContext)> routes = {
    "login": (BuildContext context) => const LoginScreen(),
    "register": (BuildContext context) => const RegisterScreen(),
    "home": (BuildContext context) => const HomeScreen(),
    "transactions": (BuildContext context) => const TransactionScreen(),
    "send": (BuildContext context) => const SendScreen(),
    "transaction_confirmed": (BuildContext context) =>
        const TransactionConfirmedScreen(),
  };

  // static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

  // }
}


// return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );