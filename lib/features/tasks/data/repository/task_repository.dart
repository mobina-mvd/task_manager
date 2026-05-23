import 'package:drift/drift.dart';
import 'package:task_manager/core/database/app_database.dart';

class TaskRepository {
  final AppDatabase db;

  TaskRepository(this.db);

  // CREATE
  Future<void> addTask(String title, String? description) {
    return db
        .into(db.tasksdbTable)
        .insert(
          TasksdbTableCompanion(
            title: Value(title),
            description: Value(description),
          ),
        );
  }

  // READ
  Future<List<TasksdbTableData>> getTasks() {
    return db.select(db.tasksdbTable).get();
  }

  // UPDATE (toggle done)
  Future<void> toggleTask(TasksdbTableData task) {
    return db
        .update(db.tasksdbTable)
        .replace(task.copyWith(isDone: !task.isDone));
  }

  // DELETE
  Future<void> deleteTask(int id) {
    return (db.delete(db.tasksdbTable)..where((t) => t.id.equals(id))).go();
  }
}
