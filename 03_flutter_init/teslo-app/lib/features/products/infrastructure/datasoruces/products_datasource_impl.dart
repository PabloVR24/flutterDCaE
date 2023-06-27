import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/domain/datasources/products_datasoruce.dart';
import 'package:teslo_shop/features/products/domain/entities/product.dart';

import '../mappers/product_mapper.dart';

class ProductsDataSourceImpl extends ProductsDataSource {
  late final Dio dio;
  final String accessToken;
  ProductsDataSourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Enviroment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<Product> createUpdatePruduct(Map<String, dynamic> productLike) {
    // TODO: implement createUpdatePruduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductByID(String id) {
    // TODO: implement getProductByID
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>('/products?limit=$limit&offset=$offset',
        );

    final List<Product> products = [];
    for (var product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
