import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class SearchField extends AdaptiveStatelessWidget {
  const SearchField({
    required this.textEditingController,
    super.key,
  });

  final TextEditingController textEditingController;

  @override
  Widget buildAndroid(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: textEditingController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        prefixIconConstraints: BoxConstraints(maxHeight: 20),
        hintText: searchFieldHintText,
      ),
    );
  }

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoTextField(
      autofocus: true,
      controller: textEditingController,
      placeholder: searchFieldHintText,
      style: context.textTheme.bodyLarge,
      prefix: const Icon(Icons.search),
    );
  }
}
