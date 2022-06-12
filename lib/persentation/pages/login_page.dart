// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/persentation/pages/home_page.dart';
import 'package:hiddengems/persentation/pages/sign_up_page.dart';
import 'package:hiddengems/persentation/widgets/aux_button.dart';
import 'package:hiddengems/persentation/widgets/cta_button.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';
import 'package:hiddengems/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  bool isLoading = false;

  String email = '';
  String password = '';

  final formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setState(() {
        isLoading = true;
      });

      try {
        await Future.delayed(const Duration(seconds: 1));
        await AuthRepository.login(email, password);
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      } catch (e) {
        AppUtils.showSnackbar(context, 'Email atau password salah.');
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'Masuk'),
      body: SingleChildScrollView(
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
                        validator: (input) => AppUtils.validateEmpty(input),
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
                        style: AppTheme.heebo14RegularBlack,
                        validator: (input) => AppUtils.validateEmpty(input),
                        onSaved: (input) => password = input ?? '',
                        decoration: AppTheme.inputDecoration('').copyWith(
                          suffixIcon: IconButton(
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                            icon: isPasswordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                CTAButton(
                  label: 'Masuk',
                  onTap: () => login(),
                  isEnabled: !isLoading,
                ),
                const SizedBox(height: 28),
                Center(
                  child: Text(
                    'atau',
                    style: AppTheme.poppins10SemiBoldGrey,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(
                    //   child: AuxButton(
                    //     label: 'Lupa Kata Sandi?',
                    //     onTap: () {},
                    //   ),
                    // ),
                    // const SizedBox(width: 10),
                    Expanded(
                      child: AuxButton(
                        label: 'Daftar',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
