class Model {
  int getId() => 1;
}

abstract class DAO {
  Model recuperar(int id);

  void excluir(int id);

  void salvar(Model obj);
}

class CacheDAO implements DAO {
  DAO dao;
  Map<int, Model> cache;
  CacheDAO(DAO dao) {
    this.dao = dao;
    this.cache = {};
  }
  Model recuperar(int id) {
    if (cache.containsKey(id)) return cache[id];
    Model obj = dao.recuperar(id);
    cache.update(id, (_) => obj);
    return obj;
  }

  void excluir(int id) {
    dao.excluir(id);
    cache.remove(id);
  }

  void salvar(Model obj) {
    dao.salvar(obj);
    int id = obj.getId();
    cache.update(id, (_) => obj);
  }
}
