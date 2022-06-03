import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/pages/signup_page.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          backgroundColor: kPurple,
          title: Text(
            'Masuk',
            style: kAppBar,
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
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
                      decoration: InputDecoration(
                        hintText: 'Alamat Email',
                        border: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kPurple, width: 2),
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
                      decoration: InputDecoration(
                        hintText: 'Kata Sandi',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPurple, width: 5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPurple.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Button(
                name: 'Masuk',
                onPressed: () {},
                backgroundColor: kPurple,
                textColor: kWhite,
              ),
              SizedBox(height: 28),
              Center(
                child: Text(
                  'atau',
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ),
              SizedBox(height: 28),
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
                          side: BorderSide(color: kPurple, width: 2),
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
                          side: BorderSide(color: kPurple, width: 2),
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
    );
  }
}
