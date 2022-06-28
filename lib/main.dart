import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/persentation/pages/home_page.dart';
import 'package:hiddengems/persentation/pages/splash_page.dart';
import 'package:hiddengems/persentation/provider/home_provider.dart';
import 'package:hiddengems/persentation/provider/rating_provider.dart';
import 'package:hiddengems/persentation/provider/search_provider.dart';
import 'package:hiddengems/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'persentation/provider/add_place_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => AddPlaceProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => RatingProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidden Gems',
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch,
        appBarTheme: AppTheme.appBarTheme,
      ),
      // home: const TestPage(),
      home: const LoginChecker(),
    );
  }
}

class LoginChecker extends StatefulWidget {
  const LoginChecker({Key? key}) : super(key: key);

  @override
  State<LoginChecker> createState() => _LoginCheckerState();
}

class _LoginCheckerState extends State<LoginChecker> {
  bool isLoggedIn = true;

  @override
  void initState() {
    if (AuthRepository.isLoggedIn()) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const HomePage() : const SplashPage();
  }
}
