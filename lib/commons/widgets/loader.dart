import 'dart:io';
import 'package:flutter/material.dart';

class FullLoader extends StatelessWidget {
  const FullLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Platform.isIOS
            ? const CircularProgressIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}