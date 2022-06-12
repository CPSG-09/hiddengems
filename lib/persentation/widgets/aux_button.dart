import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class AuxButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const AuxButton({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap(),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.bgWhite,
          border: Border.all(
            color: AppTheme.bgPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(label, style: AppTheme.poppins12SemiBoldPurple),
        ),
      ),
    );
  }
}
