import 'package:flutter/material.dart';

class AppUtils {
  static validateEmpty(String? input) {
    if (input!.isEmpty) {
      return 'Tidak boleh kosong.';
    }
    return null;
  }

  static void showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
