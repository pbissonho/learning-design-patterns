import 'dart:io';

abstract class RecuperadorArquivo {
  RecuperadorArquivo proximo;
  RecuperadorArquivo(RecuperadorArquivo proximo) {
    this.proximo = proximo;
  }
  File recuperar(String nome) {
    File a = recuperaArquivo(nome);

    if (a == null) return chamarProximo(nome);

    return a;
  }

  File chamarProximo(String nome) {
    if (proximo == null) {
      throw Exception("Não foi possível " + " recuperar o arquivo");
    }

    return proximo.recuperar(nome);
  }

  File recuperaArquivo(String nome);
}

class RecuperadorCacheMemoria extends RecuperadorArquivo {
  Map<String, File> cache = {};
  RecuperadorCacheMemoria(RecuperadorArquivo proximo) : super(proximo);
  File recuperaArquivo(String nome) {
    if (cache.containsKey(nome)) return cache[nome];
    return null;
  }

  File chamarProximo(String nome) {
    File a = super.chamarProximo(nome);
    cache.update(nome, (file) => a);
    return a;
  }
}
