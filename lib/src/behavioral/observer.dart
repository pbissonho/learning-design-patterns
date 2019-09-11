abstract class Observador {
  void onNotify();
}

class Observable {
  List<Observador> observes = [];

  void addObserver(Observador observer) {
    observes.add(observer);
  }

  void notificar() {
    observes.forEach((f) => f.onNotify());
  }
}

class IncrementBloc extends Observable {
  int value = 0;

  increment() {
    value += 0;
    notificar();
  }
}

class ConsoleObservador implements Observador {
  @override
  void onNotify() {
    print("Set state");
  }
}

class Elemento {
  Object valor;
  Elemento proximo;

  Elemento_(Object valor) {
    this.valor = valor;
  }

  Object getValor() {
    return valor;
  }

  Elemento getProximo() {
    return proximo;
  }

  void setProximo(Elemento proximo) {
    this.proximo = proximo;
  }

  int contar() {
    if (proximo == null) {
      return 1;
    }
    return 1 + proximo.contar();
  }
}
