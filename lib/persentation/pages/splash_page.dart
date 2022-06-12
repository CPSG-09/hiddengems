// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hiddengems/persentation/pages/login_page.dart';
import 'package:hiddengems/persentation/pages/sign_up_page.dart';
import 'package:hiddengems/persentation/widgets/cta_button.dart';
import 'package:hiddengems/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgWhite,
      appBar: AppBar(
        toolbarHeight: 102,
        backgroundColor: AppTheme.bgWhite,
        systemOverlayStyle: AppTheme.systemUiOverlayStyle,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: 128,
              width: 128,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_logo.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              'Hidden Gems',
              style: AppTheme.poppins24BoldBlueDark,
            ),
            Text(
              'Temukan Layanan Esensial',
              style: AppTheme.poppins16BoldGreyPurple,
            ),
            Text(
              'Keseharian Anda',
              style: AppTheme.poppins16BoldGreyPurple,
            ),
            Spacer(),
            // Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CTAButton(
                  label: 'Masuk untuk Memulai',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                ),
                const SizedBox(height: 16),
                CTAButton(
                    label: 'Daftar',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                    },
                    secondary: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
