import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/providers/task_provider.dart';
import 'package:task_manager/features/tasks/data/repository/task_repository.dart';
import 'package:task_manager/core/database/app_database.dart';

final taskControllerProvider =
    AsyncNotifierProvider<TaskController, List<TasksdbTableData>>(
      TaskController.new,
    );

class TaskController extends AsyncNotifier<List<TasksdbTableData>> {
  late TaskRepository _repo;

  @override
  Future<List<TasksdbTableData>> build() async {
    _repo = ref.read(taskRepositoryProvider);
    return _repo.getTasks();
  }

  Future<void> addTask(String title, String? description) async {
    await _repo.addTask(title, description);
    await _refresh();
  }

  Future<void> deleteTask(int id) async {
    await _repo.deleteTask(id);
    await _refresh();
  }

  Future<void> toggleTask(TasksdbTableData task) async {
    await _repo.toggleTask(task);
    await _refresh();
  }

  Future<void> _refresh() async {
    state = const AsyncLoading();
    final tasks = await _repo.getTasks();
    state = AsyncData(tasks);
  }
}
