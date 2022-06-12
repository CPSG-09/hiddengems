// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/persentation/pages/home_page.dart';
import 'package:hiddengems/persentation/widgets/cta_button.dart';
import 'package:hiddengems/persentation/widgets/loading_content.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';
import 'package:hiddengems/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      formKey.currentState!.save();
      try {
        await Future.delayed(const Duration(seconds: 1));
        await AuthRepository.signUp(email, password);
        AppUtils.showSnackbar(context, 'Berhasil mendaftar.');
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (e) {
        AppUtils.showSnackbar(context, 'Gagal mendaftar.');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        titleText: 'Daftar',
      ),
      body: isLoading
          ? const LoadingContent()
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'Email',
                                style: AppTheme.poppins14BoldBlueDark,
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: AppTheme.heebo14RegularBlack,
                              decoration: AppTheme.inputDecoration(''),
                              validator: (input) =>
                                  AppUtils.validateEmpty(input),
                              onSaved: (input) => email = input ?? '',
                            ),
                            const SizedBox(height: 28.0),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'Kata Sandi',
                                style: AppTheme.poppins14BoldBlueDark,
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              style: AppTheme.heebo14RegularBlack,
                              decoration: AppTheme.inputDecoration(
                                  '8 atau lebih karakter'),
                              validator: (input) =>
                                  AppUtils.validateEmpty(input),
                              onSaved: (input) => password = input ?? '',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      CTAButton(
                        label: 'Daftar',
                        onTap: () => signUp(),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
