import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class CTAButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool secondary;
  final bool isEnabled;

  const CTAButton({
    required this.label,
    required this.onTap,
    this.secondary = false,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        if (isEnabled) {
          onTap();
        }
      },
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondary ? AppTheme.bgWhite : AppTheme.bgPurple,
          border: Border.all(
            color: AppTheme.bgPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: isEnabled
              ? Text(
                  label,
                  style: secondary
                      ? AppTheme.poppins14SemiBoldPurple
                      : AppTheme.poppins14SemiBoldWhite,
                )
              : Ink(
                  height: 21,
                  width: 21,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.fgWhite,
                  )),
        ),
      ),
    );
  }
}
