import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_for_class/model/student.dart';
import 'package:riverpod_for_class/state/student_state.dart';

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
        (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.inital());

  void addStudent(Student student) async {
    state = state.copyWith(isLoading: true);
    // wait for 2 seconds and update the student list
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false, student: student);
  }
}
