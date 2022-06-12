import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class IconMenu extends StatelessWidget {
  final String label;
  final String path;
  final bool isSecondRow;
  final Function onTap;

  const IconMenu({
    required this.label,
    required this.path,
    this.isSecondRow = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: 52,
      child: Material(
        color: const Color(0x00FFFFFF),
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path),
                  ),
                ),
              ),
              Text(
                label,
                style: isSecondRow
                    ? AppTheme.heebo10MediumBlueDark
                    : AppTheme.heebo10MediumWhite,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
