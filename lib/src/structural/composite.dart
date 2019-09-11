abstract class TrechoAereo {
  String getOrigem();

  String getDestino();

  double getPreco();
}

class TrechoSimples with TrechoAereo {
  String origem;
  String destino;
  double preco;

  TrechoSimples(String origem, String destino, double preco) {
    this.origem = origem;
    this.destino = destino;
    this.preco = preco;
  }

  String getOrigem() {
    return origem;
  }

  String getDestino() {
    return destino;
  }

  double getPreco() {
    return preco;
  }
}

class TrechoComposto with TrechoAereo {
  TrechoAereo primeiro;
  TrechoAereo segundo;
  double taxaconexao;

  TrechoComposto(
      TrechoAereo primeiro, TrechoAereo segundo, double taxaconexao) {
    this.primeiro = primeiro;
    this.segundo = segundo;
    this.taxaconexao = taxaconexao;
    if (primeiro.getDestino() != segundo.getOrigem()) {
      throw Exception(
          "O destino do primeiro" + "não é igual a origem do segundo");
    }
  }

  String getOrigem() {
    return primeiro.getOrigem();
  }

  String getDestino() {
    return segundo.getDestino();
  }

  double getPreco() {
    return (primeiro.getPreco() + segundo.getPreco()) + taxaconexao;
  }
}
