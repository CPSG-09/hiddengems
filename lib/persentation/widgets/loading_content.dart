import 'package:flutter/material.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
