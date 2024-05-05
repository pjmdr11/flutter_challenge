import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30.0,
        width: 30.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
