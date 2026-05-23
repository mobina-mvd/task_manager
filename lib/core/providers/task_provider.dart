import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/database/app_database.dart';
import 'package:task_manager/features/tasks/data/repository/task_repository.dart';

final Provider<AppDatabase> databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase.instance;

  ref.onDispose(() {
    db.close();
  });

  return db;
});

final Provider<TaskRepository> taskRepositoryProvider =
    Provider<TaskRepository>((ref) {
      final db = ref.read(databaseProvider);

      return TaskRepository(db);
    });
