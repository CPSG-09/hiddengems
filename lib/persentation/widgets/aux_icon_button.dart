import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class AuxIconButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final IconData iconData;

  const AuxIconButton({
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
        width: 128,
        padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
        decoration: BoxDecoration(
          color: AppTheme.bgWhite,
          border: Border.all(
            color: AppTheme.bgPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              color: AppTheme.fgPurple,
              size: 16,
            ),
            Text(label, style: AppTheme.poppins12SemiBoldPurple),
          ],
        ),
      ),
    );
  }
}
