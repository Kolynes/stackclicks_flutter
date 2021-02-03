abstract class Observable<E, P> {
  Map<E, List<Function>> listeners;

  void addListener(E event, Function(P) function) {
    if(listeners[event] == null)
      listeners[event] = <Function(P)>[function];
    else listeners[event].add(function);
  }

  void removeListener(E event, Function function) {
    if(listeners[event] == null)
      return;
    else listeners[event].remove(function);
  }

  void notifyListeners(E event, P payload) {
    listeners[event].forEach((element) => element(payload));
  }

}