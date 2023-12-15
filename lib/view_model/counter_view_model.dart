import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider
final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, int>((ref) {
  return CounterViewModel();
});

// View Model -> Business logic

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);

  // increment
  void increment() {
    state = state + 1;
  }

  //decrement
  void decrement() {
    if (state == 0) return;
    state = state - 1;
  }
}
