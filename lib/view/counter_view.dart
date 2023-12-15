import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Provider -> Jasle state lai provide garne
// 2. Consumer -> Jasle state lai consumer garne
//3. Widget ref -> Provider to widget
//4. Provider ref -> provider to provider

// 1. create a app bar provider
final appBarTitleProvider = Provider<String>((ref) {
  return "Coutner view";
});

// 2. create a counter provider
final counterProvider = StateProvider<int>((ref) {
  return 1;
});

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.read(appBarTitleProvider),
        ),
      ),
      body: Center(
        child: Text(
          ref.watch(counterProvider).toString(),
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
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              if (ref.read(counterProvider.notifier).state == -2) return;
              ref.read(counterProvider.notifier).state--;
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
