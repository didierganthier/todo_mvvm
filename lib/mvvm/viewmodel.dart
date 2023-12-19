import 'package:todo_mvvm/mvvm/observer.dart';

abstract class EventViewModel {
  final List<EventObserver> _observers = [];

  void addObserver(EventObserver observer) {
    if (_observers.contains(observer)) {
      return;
    }

    _observers.add(observer);
  }

  bool removeObserver(EventObserver observer) {
    if (_observers.contains(observer)) {
      _observers.remove(observer);
      return false;
    }

    return true;
  }

  void notify(ViewEvent event) {
    _observers.forEach((observer) => observer.notify(event));
  }
}
