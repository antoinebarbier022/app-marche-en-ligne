part of 'shop_bloc.dart';

/// The events we will need to handle in our ShopBloc are:

/// ShopLoaded - tells the bloc that it needs to load the shop from the ShopRepository.
/// ItemAdded - tells the bloc that it needs to add a new item to the list of cart.
/// ItemUpdated - tells the bloc that it needs to update an existing item.
/// ItemDeleted - tells the bloc that it needs to remove an existing item.
/// ClearShop - tells the bloc that it needs to clear the cart.

@immutable
abstract class ShopEvent {
  const ShopEvent();

  List<Object> get props => [];
}

class ShopLoaded extends ShopEvent {}

class ItemAdded extends ShopEvent {
  final Product product;

  const ItemAdded(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ItemAdded { product: $product }';
}

class ItemUpdated extends ShopEvent {
  final Product product;

  const ItemUpdated(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ItemUpdated { product: $product }';
}

class ItemDeleted extends ShopEvent {
  final Product product;

  const ItemDeleted(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ItemDeleted { product: $product }';
}

class ClearShop extends ShopEvent {}

