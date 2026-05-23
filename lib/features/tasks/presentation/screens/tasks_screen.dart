import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_controller.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: tasks.when(
        data: (taskList) {
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description ?? ''),
                trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    ref.read(taskControllerProvider.notifier).toggleTask(task);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, stacTrace) {
          debugPrint('ERROR MESSAGE : $e');
          debugPrint('STACK TTRACE MESSAGE : $stacTrace');
          return Text('ERROR');
        },
      ),
    );
  }
}
