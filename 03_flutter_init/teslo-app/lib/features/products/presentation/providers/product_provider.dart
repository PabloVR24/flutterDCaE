import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/domain/entities/product.dart';
import 'package:teslo_shop/features/products/presentation/providers/products_repository_provider.dart';

final productProvider = StateNotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>((ref, productID) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return ProductNotifier(
      productsRepository: productsRepository, productID: productID);
});

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository productsRepository;
  ProductNotifier({required this.productsRepository, required String productID})
      : super(ProductState(id: productID)) {
    loadProduct();
  }

  Product newEmptyProduct() {
    return Product(
      id: 'new',
      title: '',
      price: 0,
      description: '',
      slug: '',
      stock: 0,
      sizes: ['XS'],
      gender: 'men',
      tags: [],
      images: [],
    );
  }

  Future<void> loadProduct() async {
    if (state.id == 'new') {
      state = state.copyWith(isLoading: false, product: newEmptyProduct());
      return;
    }
    try {
      final product = await productsRepository.getProductByID(state.id);
      state = state.copyWith(isLoading: false, product: product);
    } catch (e) {
      print(e);
    }
  }
}

class ProductState {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState(
      {required this.id,
      this.isLoading = true,
      this.isSaving = false,
      this.product});

  ProductState copyWith(
          {String? id, Product? product, bool? isLoading, bool? isSaving}) =>
      ProductState(
          id: id ?? this.id,
          product: product ?? this.product,
          isLoading: isLoading ?? this.isLoading,
          isSaving: isSaving ?? this.isSaving);
}