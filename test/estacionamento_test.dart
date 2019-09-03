import 'package:design_patterns/src/strategy.dart';
import 'package:test/test.dart';

void main() {
  test("Calculo15Minutos", () {
    Calculo15Minutos calculo15minutos = Calculo15Minutos(2);

    var result = calculo15minutos.calcular(10);
    expect(20, result);
  });

  test("Calculo Diario", () {
    CalculoDiario calculoDiario = CalculoDiario(2);

    var result = calculoDiario.calcular(10);
    expect(16, result);
  });

  test("Calculo TarifaEstacionamento", () {
    CalculoDiario calculoDiario = CalculoDiario(2);

    TarifaEstacionamento tarifa = TarifaEstacionamento(calculoDiario, 10);


    var result = tarifa.valorConta();
    expect(16, result);

  });
}
