import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';

class IconMenu extends StatelessWidget {
  final String title;
  final String image;
  final Color titleColor;
  final Function() onTap;

  const IconMenu(
      {required this.title,
      required this.image,
      this.titleColor = kWhite,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
        ),
        Text(
          title,
          style: kSubtitle.copyWith(color: titleColor),
        )
      ],
    );
  }
}
