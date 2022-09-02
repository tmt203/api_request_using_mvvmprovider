import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, this.errorText}) : super(key: key);

  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(errorText.toString(), style: const TextStyle(color: Colors.red)),
    );
  }
}
