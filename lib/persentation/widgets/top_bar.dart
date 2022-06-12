import 'package:flutter/material.dart';
import 'package:hiddengems/theme.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  const TopBar({
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 64,
      elevation: 0,
      systemOverlayStyle: AppTheme.systemUiOverlayStyle,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 24),
          ),
          const Spacer(),
          Text(
            titleText,
            style: AppTheme.poppins16SemiBoldWhite,
          ),
          const Spacer(),
          const SizedBox(width: 24 + 24),
        ],
      ),
    );
  }
}
