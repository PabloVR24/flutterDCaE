import 'package:teslo_shop/features/products/domain/entities/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0});
  Future<Product> getProductByID(String id);
  Future<List<Product>> searchProductByTerm(String term);
  Future<Product> createUpdatePruduct(Map<String, dynamic> productLike);
}
