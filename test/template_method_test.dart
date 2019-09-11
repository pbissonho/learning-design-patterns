import 'dart:io';

import 'package:design_patterns/src/behavioral/template_method.dart';
import 'package:test/test.dart';

void main() {
  test("GeradorXML", () async {
    File file;
    GeradorDeArquivoXML geradorDeArquivoXML = GeradorDeArquivoXML();

    file = await geradorDeArquivoXML
        .gerarArquivo("Arquivo.txt", {"tuca": "bento"});

    String result = await file.readAsString();

    expect("bento", result);
    ;
  });
}
