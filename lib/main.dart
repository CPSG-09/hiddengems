import 'package:flutter/material.dart';
import 'package:hiddengems/common/utils.dart';
import 'package:hiddengems/persentation/pages/login_page.dart';
import 'package:hiddengems/persentation/pages/signup_page.dart';
import 'package:hiddengems/persentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hidden Gems',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
      home: const SplashPage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const SplashPage());
          case LoginPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => LoginPage());
          case SignUpPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => SignUpPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                  body: Center(
                child: Text('Page Not Found'),
              ));
            });
        }
      },
    );
  }
}
