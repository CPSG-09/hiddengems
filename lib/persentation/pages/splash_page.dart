import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/pages/login_page.dart';
import 'package:hiddengems/persentation/pages/signup_page.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.access_alarm,
                size: 80,
              ),
              Text(
                'Hidden Gems',
                style: kTitleApp,
              ),
              Text(
                'Temukan Layanan Esensial',
                style: kSubtitleApp.copyWith(color: kGrey),
              ),
              Text(
                'Keseharian Anda',
                style: kSubtitleApp.copyWith(color: kGrey),
              ),
              const Spacer(),
              // Button
              Button(
                name: 'Masuk Untuk Memulai',
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.ROUTE_NAME);
                },
                backgroundColor: kPurple,
                textColor: kWhite,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Button(
                    name: 'Daftar',
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.ROUTE_NAME);
                    },
                    backgroundColor: Colors.transparent,
                    textColor: kPurple,
                  )),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
