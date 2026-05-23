import 'package:go_router/go_router.dart';
import 'package:task_manager/features/tasks/presentation/screens/tasks_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [GoRoute(path: '/', builder: (context, state) => TasksScreen())],
  );
}
