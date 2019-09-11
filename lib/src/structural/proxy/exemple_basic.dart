abstract class Transacao {
  void executar();
}

class ProxyAssincrono implements Transacao {
  Transacao _transacao;
  ProxyAssincrono(Transacao transacao) {
    this._transacao = transacao;
  }
  void executar() {
    Runnable runnable = Runnable();

    _transacao.executar();

    Thread thread = Thread(runnable);
    thread.start();
  }
}

class Thread {
  Thread(Runnable runnable);

  void executar() {}

  void start() {}
}

class Runnable {}
