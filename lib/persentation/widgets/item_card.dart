import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String address;
  final String time;
  final Function() onTap;

  const ItemCard(
      {required this.title,
      required this.address,
      required this.time,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: SizedBox(
              width: 56,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/logo_app.png'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kTitle,
              ),
              const SizedBox(height: 6),
              Text(
                address,
                style: kSubtitle,
              ),
              Text.rich(
                TextSpan(
                  text: time,
                  style: kSubtitle.copyWith(color: kPink),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
