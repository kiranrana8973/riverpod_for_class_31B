import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_for_class/view_model/counter_view_model.dart';

// 1. Provider -> Jasle state lai provide garne
// 2. Consumer -> Jasle state lai consumer garne
//3. Widget ref -> Provider to widget
//4. Provider ref -> provider to provider

// 1. create a app bar provider
final appBarTitleProvider = Provider<String>((ref) {
  return "Coutner view";
});

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.read(appBarTitleProvider),
        ),
      ),
      body: Center(
        child: Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
