import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/pages/home_page.dart';
import 'package:hiddengems/persentation/pages/signup_page.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          backgroundColor: kPurple,
          title: Text(
            'Masuk',
            style: kAppBar,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 28),
            child: Column(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Email',
                          style: kFieldTitle,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: kFieldInput,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Alamat Email',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: kPurple, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPurple.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Kata Sandi',
                          style: kFieldTitle,
                        ),
                      ),
                      TextFormField(
                        style: kFieldInput,
                        decoration: InputDecoration(
                          hintText: 'Kata Sandi',
                          suffixIcon: IconButton(
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                            icon: isPasswordVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: kPurple, width: 5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPurple.withOpacity(0.2),
                            ),
                          ),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Button(
                  name: 'Masuk',
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.ROUTE_NAME);
                  },
                  backgroundColor: kPurple,
                  textColor: kWhite,
                ),
                const SizedBox(height: 28),
                Center(
                  child: Text(
                    'atau',
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 147,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: kPurple, width: 2),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'Lupa Kata Sandi',
                          style: kButton.copyWith(fontSize: 12, color: kPurple),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 147,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.ROUTE_NAME);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: kPurple, width: 2),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'Daftar',
                          style: kButton.copyWith(fontSize: 12, color: kPurple),
                        ),
                      ),
                    ),
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
