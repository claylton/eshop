import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ProgressIndicatorWidget extends StatelessWidget {

  const ProgressIndicatorWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();
  }
}