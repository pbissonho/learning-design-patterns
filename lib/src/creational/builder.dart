class BuilderGerador {
  GeradorArquivo instancia;
  BuilderGerador gerandoEmXML() {
    instancia = GeradorDeArquivoXML();
    return this;
  }

  BuilderGerador gerandoEmPropriedades() {
    instancia = GeradorPropriedades();
    return this;
  }

  BuilderGerador comCriptografia() {
    adicionaProcessador(Criptografador());
    return this;
  }

  BuilderGerador comCompactacao() {
    adicionaProcessador(Compactador());
    return this;
  }

  BuilderGerador adicionaProcessador(PosProcessador p) {
    PosProcessador atual = instancia.getProcessador();
    if (atual is NullProcessador) {
      instancia.setProcessador(p);
    } else {
      PosProcessadorComposto pc = PosProcessadorComposto();
      pc.add(atual);
      pc.add(p);
      instancia.setProcessador(pc);
    }
    return this;
  }

  GeradorArquivo construir() {
    return instancia;
  }
}

class NullProcessador {}

class GeradorArquivo {
  PosProcessador getProcessador() {}

  void setProcessador(PosProcessador p) {}
}

class GeradorPropriedades extends GeradorArquivo {}

class Compactador extends PosProcessador {}

class ProcessadorTeste extends PosProcessador {}

class Criptografador extends PosProcessador {}

class PosProcessadorComposto extends PosProcessador {
  void add(PosProcessador atual) {}
}

class PosProcessador {}

class GeradorDeArquivoXML extends GeradorArquivo {}

class TestBuilder {
  TestBuilder() {
    var geradorArquivo = BuilderGerador()
        .comCompactacao()
        .comCriptografia()
        .adicionaProcessador(ProcessadorTeste())
        .construir();
  }
}
