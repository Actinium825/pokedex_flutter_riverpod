import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  String build() => '';

  void setLoadingKey(String key) => state = key;

  void clear() => state = '';
}
