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

class ShopLoaded extends ShopEvent {
  final String idUser ;

  const ShopLoaded({this.idUser = ""});
  @override
  List<Object> get props => [idUser];
}

class ItemAdded extends ShopEvent {
  final String idUser;
  final Item item;

  const ItemAdded({required this.item, this.idUser=""});

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'ItemAdded { product: ${item.product} -> ${item.quantity}}';
}

class ItemUpdated extends ShopEvent {
  final String idUser;
  final Item item;

  const ItemUpdated({required this.item, this.idUser=""});

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'ItemUpdated { product: ${item.product} -> ${item.quantity}}';
}

class ItemDeleted extends ShopEvent {
  final String idUser;
  final Product? product;

  const ItemDeleted({required this.product, this.idUser=""});

  @override
  List<Object> get props => [product as Object];

  @override
  String toString() => 'ItemDeleted { product: $product }';
}

class ClearShop extends ShopEvent {}

