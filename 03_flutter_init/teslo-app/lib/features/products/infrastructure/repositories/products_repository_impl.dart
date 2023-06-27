import 'package:teslo_shop/features/products/domain/datasources/products_datasoruce.dart';
import 'package:teslo_shop/features/products/domain/entities/product.dart';
import 'package:teslo_shop/features/products/domain/repositories/products_repository.dart';

class ProductRepositoryImpl extends ProductsRepository {
  final ProductsDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Product> createUpdatePruduct(Map<String, dynamic> productLike) {
    return createUpdatePruduct(productLike);
  }

  @override
  Future<Product> getProductByID(String id) {
    return getProductByID(id);
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    return dataSource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    return searchProductByTerm(term);
  }
}
