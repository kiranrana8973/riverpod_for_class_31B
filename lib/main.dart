import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_for_class/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
  