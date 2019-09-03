import 'dart:io';

abstract class GeradorArquivo {
  Future<File> gerarArquivo(
      String nome, Map<String, dynamic> propriedades) async {
    String conteudo = gerarConteudo(propriedades);

    var processado = processar(conteudo);
    var file = File(nome);

    return await file.writeAsString(processado);
  }

  String processar(String bytes) {
    return bytes;
  }

  String gerarConteudo(Map<String, Object> propriedades);
}

class GeradorDeArquivoXML extends GeradorArquivo {
  @override
  String gerarConteudo(Map<String, Object> propriedades) {
    var buffer = StringBuffer();
    buffer.writeAll(propriedades.values);

    return buffer.toString();
  }
}

class GeradorDeArquivoXMLCriptografado extends GeradorArquivo {
  final int delay;

  GeradorDeArquivoXMLCriptografado(this.delay);

  @override
  String gerarConteudo(Map<String, Object> propriedades) {
    var buffer = StringBuffer();
    buffer.writeAll(propriedades.values);

    return buffer.toString();
  }

  @override
  String processar(String value) {
    List<int> bytes = List<int>();

    bytes.addAll(value.codeUnits);

    for (var i = 0; i < bytes.length; i++) {
      bytes[i] = (bytes[i] + delay);
    }
    return bytes.toString();
  }
}
