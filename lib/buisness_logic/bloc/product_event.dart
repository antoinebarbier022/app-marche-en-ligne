part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProducts extends ProductEvent {
  GetAllProducts();
}

