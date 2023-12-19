import 'package:flutter/material.dart';
import 'package:todo_mvvm/mvvm/observer.dart';
import 'package:todo_mvvm/mvvm/viewmodel.dart';
import 'package:todo_mvvm/task/model.dart';
import 'package:todo_mvvm/task/repository.dart';

class TaskViewModel extends EventViewModel {
  TaskRepository _repository;

  TaskViewModel(this._repository);

  void loadTasks() async {
    notify(LoadingEvent(isLoading: true));
    _repository.loadTasks().then((value) {
      notify(TasksLoadedEvent(tasks: value));
      notify(LoadingEvent(isLoading: false));
    });
  }

  void addTask(String title, String description) {
    notify(LoadingEvent(isLoading: true));
    Task task = Task(0, title, description, false);
    _repository.addTask(task);
    notify(TaskAddedEvent(task: task));
    notify(LoadingEvent(isLoading: false));
  }
}

class LoadingEvent extends ViewEvent {
  bool isLoading;

  LoadingEvent({required this.isLoading}) : super('LoadingEvent');
}

class TasksLoadedEvent extends ViewEvent {
  List<Task> tasks;

  TasksLoadedEvent({required this.tasks}) : super('TasksLoadedEvent');
}

class TaskAddedEvent extends ViewEvent {
  Task task;

  TaskAddedEvent({required this.task}) : super('TaskAddedEvent');
}
