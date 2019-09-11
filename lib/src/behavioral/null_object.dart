class Carrinho {
  int total;

  int getTotal() {
    return total;
  }
}

class CarrinhoNulo extends Carrinho {
  @override
  int getTotal() {
    return 0;
  }
}
