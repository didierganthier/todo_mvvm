import 'package:todo_mvvm/task/model.dart';

class TaskRepository {
  final List<Task> _tasks = [
    Task(0, 'Complete Todo App',
        'Complete the Todo App using MVVM architecture', false),
  ];

  void addTask(Task task) {
    task.id = _tasks.length;
    _tasks.add(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }

  void updateTask(Task task) {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
  }

  Future<List<Task>> loadTasks() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_tasks);
  }
}
