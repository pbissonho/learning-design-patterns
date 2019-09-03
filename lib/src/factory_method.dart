import 'template_method.dart';

/*
abstract class DAO<E> {
  E recuperarPorId(Object id);

  void salvar(E entidade);

  void excluir(Object id);

  List<E> listarTodos();
}

abstract class ServicoAbstrato<E> {
  GeradorArquivo gerador;

  ServicoAbstrato(GeradorArquivo gerador) {
    this.gerador = gerador;
  }

  DAO<E> getDAO();

  void gravarEntidadeEmArquivo(Object id, String nomeArquivo) {
    E entidade = getDAO().recuperarPorId(id);
    gerador.gerarArquivo(nomeArquivo, entidade.getMap());
  }
}

class ServicoProduto extends ServicoAbstrato<Produto> {
  DAO<Produto> dao;

  ServicoProduto(GeradorArquivo gerador) : super(gerador);

  DAO<Produto> getDAO() {
    if (dao == null) {
      dao = new ProdutoDAO();
          }
          return dao;
        }
      
        double getPrecoProduto(Object produtoId) {
          Produto p = getDAO().recuperarPorId(produtoId);
          return p.getPreco();
        }
      }
      
      class ProdutoDAO {
}

class Produto {
  double getPreco() {
    return 20;
  }
}

*/
