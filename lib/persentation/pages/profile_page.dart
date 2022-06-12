// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/main.dart';
import 'package:hiddengems/persentation/widgets/aux_icon_button.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'Profil'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Masuk sebagai', style: AppTheme.poppins14BoldBlueDark),
              Text(AuthRepository.getEmail() ?? 'Tidak ada email',
                  style: AppTheme.poppins24BoldBlueDark),
              const SizedBox(height: 28),
              Row(
                children: [
                  AuxIconButton(
                    label: 'Keluar',
                    onTap: () async {
                      await AuthRepository.signOut();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginChecker(),
                          ));
                    },
                    iconData: Icons.logout,
                  ),
                  const Spacer()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
