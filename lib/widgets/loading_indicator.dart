import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid ? CircularProgressIndicator(color: color) : CupertinoActivityIndicator(color: color),
    );
  }
}
