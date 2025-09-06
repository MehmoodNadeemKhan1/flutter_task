abstract interface class IRepository<T>{
  Future<T> create(T item);
  Future<List<T>>? list();
  Future<T> update(String id , T updatedItem );
  Future<bool> delete(String id);
}