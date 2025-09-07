
abstract interface class IService<T> {
  Future<T?> createProduct(T item );
  Future<List<T>?> allProducts();
  Future<T?> singleProduct(String id);
  Future<T?> updateProduct(String id, T updatedItem);
  Future<bool?> deleteProduct(String id);
}
