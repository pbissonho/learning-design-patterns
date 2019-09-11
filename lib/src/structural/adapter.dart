abstract class SMSSender {
  bool sendSMS(SMS sms);
}

class SMS {
  String _destino;
  String _origem;
  String _texto;

  String get getDestino => _destino;
  String get getOrigem => _origem;
  String get getTexto => _texto;
}

abstract class EnviadorSMS {
  void enviarSMS(String destino, String origem, List<String> msgs);
}

class SMSAdapter implements SMSSender {
  EnviadorSMS env;

  SMSAdapter(EnviadorSMS env) {
    this.env = env;
  }

  bool sendSMS(SMS sms) {
    String dest = sms.getDestino;
    String orig = sms.getOrigem;
    List<String> txts = quebrarMsgs(sms.getTexto);
    try {
      env.enviarSMS(dest, orig, txts);
    } catch (e) {
      print(e.message);
      return false;
    }
    return true;
  }

  List<String> quebrarMsgs(String text) {
    int size = text.length;
    int qtd = (((size % 160) == 0) ? (size ~/ 160) : ((size ~/ 160) + 1));
    List<String> msgs = List<String>(qtd);
    for (int i = 0; i < qtd; i++) {
      int min = (i * 160);
      int max = ((i == (qtd - 1)) ? size : ((i + 1) * 160));
      msgs[i] = text.substring(min, max);
    }
    return msgs;
  }
}
