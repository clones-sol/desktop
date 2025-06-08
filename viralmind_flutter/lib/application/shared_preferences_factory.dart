import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/domain/local/shared_preferences_factory.dart';

part 'shared_preferences_factory.g.dart';

@riverpod
SharedPreferencesFactory sharedPreferencesFactory(
  Ref ref,
) {
  return SharedPreferencesFactory();
}
