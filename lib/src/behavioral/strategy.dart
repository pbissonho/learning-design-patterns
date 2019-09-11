class TarifaEstacionamento {
  ICalculoValor calculo;
  double quantidadeDeHoras;

  double valorConta() {
    return calculo.calcular(quantidadeDeHoras);
  }

  TarifaEstacionamento(this.calculo, this.quantidadeDeHoras);

  void setCalculo(ICalculoValor calculo) {
    this.calculo = calculo;
  }
}

abstract class ICalculoValor {
  calcular(double quantidadeDeHoras);
}

class CalculoDiario implements ICalculoValor {
  final double valorHora;

  CalculoDiario(this.valorHora);

  @override
  calcular(double quantidadeDeHoras) {
    var total = quantidadeDeHoras * valorHora;
    var desconto = total * 0.20;

    return total - desconto;
  }
}

class Calculo15Minutos implements ICalculoValor {
  final double valorHora;

  Calculo15Minutos(this.valorHora);

  @override
  calcular(double quantidadeDeHoras) {
    return quantidadeDeHoras * valorHora;
  }
}
