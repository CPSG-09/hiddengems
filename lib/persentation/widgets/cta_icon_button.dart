import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class CTAIconButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final IconData iconData;

  const CTAIconButton({
    required this.label,
    required this.onTap,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap(),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.bgPurple,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.bgPurple,
            width: 0,
          ),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: AppTheme.fgWhite,
              ),
              const Spacer(),
              Text(
                label,
                style: AppTheme.poppins14SemiBoldWhite,
              ),
              const Spacer(),
              const SizedBox(width: 24)
            ]),
      ),
    );
  }
}
