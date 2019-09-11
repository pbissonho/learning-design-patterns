import 'package:design_patterns/src/behavioral/null_object.dart';
import 'package:test/test.dart';

void main() {
  test("Null Object", () {
    Carrinho carrinho = CarrinhoNulo();

    carrinho.getTotal();
  });
}
