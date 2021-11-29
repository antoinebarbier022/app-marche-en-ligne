part of 'product_bloc.dart';

@immutable
abstract class ProductState {
}

class ProductsInitial extends ProductState {
}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}

class ProductsLoading extends ProductState {}

class ProductsNotLoaded extends ProductState {}
