import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class ProfilePage extends StatelessWidget {
  static const ROUTE_NAME = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
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
            'Profile',
            style: kAppBar,
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk Sebagai',
              style: kFieldTitle,
            ),
            Text(
              'Budi Budiman',
              style: kTitleApp,
            ),
            const SizedBox(height: 15),
            Text(
              'budi@example.com',
              style: kFieldTitle.copyWith(color: kGrey),
            ),
            const Spacer(),
            Button(
              name: 'Keluar',
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              textColor: kPurple,
            ),
          ],
        ),
      ),
    );
  }
}
