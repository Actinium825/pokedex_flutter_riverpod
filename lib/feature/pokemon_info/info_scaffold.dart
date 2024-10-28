import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';

class InfoScaffold extends AdaptiveStatelessWidget {
  const InfoScaffold({
    required this.children,
    required this.color,
    super.key,
  });

  final Color color;
  final List<Widget> children;

  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color),
      backgroundColor: color,
      body: context.isPortrait ? Column(children: children) : Row(children: children),
    );
  }

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: color,
        border: const Border(),
      ),
      backgroundColor: color,
      child: context.isPortrait ? Column(children: children) : Row(children: children),
    );
  }
}
