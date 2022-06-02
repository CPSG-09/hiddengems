import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: kPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: const Text('Masuk Untuk Memulai'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: kPurple),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: Text(
                      'Daftar',
                      style: kButton.copyWith(color: kPurple),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 50),

              // // button
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 27.0),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: kPurple,
              //         borderRadius: BorderRadius.circular(100),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Center(
              //           child: Text(
              //             'Masuk Untuk Memulai',
              //             style: kButton.copyWith(color: kWhite),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 27.0),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: kPurple, width: 2),
              //         borderRadius: BorderRadius.circular(100),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Center(
              //           child: Text(
              //             'Daftar',
              //             style: kButton.copyWith(color: kPurple),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
