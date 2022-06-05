import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  static const ROUTE_NAME = '/signup';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  String password = '';

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
            'Daftar',
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
                          'Nama',
                          style: kFieldTitle,
                        ),
                      ),
                      TextFormField(
                        style: kFieldInput,
                        decoration: InputDecoration(
                          hintText: 'Nama Lengkap',
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
                          'Email',
                          style: kFieldTitle,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: kFieldInput,
                        decoration: InputDecoration(
                          hintText: 'Alamat Email',
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
                const SizedBox(height: 28),
                Button(
                  name: 'Daftar',
                  onPressed: () {},
                  backgroundColor: kPurple,
                  textColor: kWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
