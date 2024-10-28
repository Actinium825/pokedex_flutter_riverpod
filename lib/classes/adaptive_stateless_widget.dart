import 'package:flutter/material.dart';

abstract class AdaptiveStatelessWidget extends StatelessWidget {
  const AdaptiveStatelessWidget({super.key});

  Widget buildAndroid(BuildContext context);

  Widget buildIos(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android ? buildAndroid(context) : buildIos(context);
  }
}
