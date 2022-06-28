import 'package:flutter/material.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'Tentang Aplikasi'),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hidden Gems',
              style: AppTheme.poppins24BoldBlueDark,
            ),
            Text(
              'Temukan Layanan Essensial Keseharian Anda',
              style: AppTheme.heebo12MediumBlueDark,
            ),
            const SizedBox(height: 28),
            Text(
              'Dikembangkan oleh:',
              style: AppTheme.poppins14BoldBlueDark,
            ),
            const SizedBox(height: 12),
            Text(
              'P2253D212 Alfie Aryananda',
              style: AppTheme.poppins16BoldGreyPurple,
            ),
            const SizedBox(height: 12),
            Text(
              'P7392A393 Farrisa Nanindhiya Rifqah Aygi',
              style: AppTheme.poppins16BoldGreyPurple,
            ),
            const SizedBox(height: 12),
            Text(
              'P2013D058 Mirza Miftahul Fadillah',
              style: AppTheme.poppins16BoldGreyPurple,
            ),
            const SizedBox(height: 12),
            Text(
              'P2145D110 Ida Bagus Surya Putrawan',
              style: AppTheme.poppins16BoldGreyPurple,
            )
          ],
        ),
      ),
    );
  }
}
