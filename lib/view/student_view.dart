import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_for_class/model/student.dart';
import 'package:riverpod_for_class/view_model/student_view_model.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student view'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                hintText: 'Enter fname',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                hintText: 'Enter last name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(studentViewModelProvider.notifier).addStudent(
                        Student(
                          fname: _fnameController.text,
                          lname: _lnameController.text,
                        ),
                      );
                },
                child: const Text('Add Student'),
              ),
            ),
            const SizedBox(height: 8),
            studentState.isLoading
                ? const CircularProgressIndicator()
                : studentState.lstStudents.isEmpty
                    ? const Text('No student added')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: studentState.lstStudents.length,
                          itemBuilder: (context, index) {
                            final student = studentState.lstStudents[index];
                            return ListTile(
                              title: Text(student.fname),
                              subtitle: Text(student.lname),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
