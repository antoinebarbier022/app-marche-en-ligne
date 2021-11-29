part of 'shop_bloc.dart';

/// The three states we will implement are:

/// ShopLoadInProgress - the state while our application is fetching shop from the repository.
/// ShopLoadSuccess - the state of our application after the shop have successfully been loaded.
/// ShopLoadFailure - the state of our application if the shop was not successfully loaded.


@immutable
abstract class ShopState {
  const ShopState();
  List<Object> get props => [];
}

// ShopInitial
class ShopInitial extends ShopState {}

// ShopLoadInProgress
class ShopLoadInProgress extends ShopState {}

// ShopLoadSuccess
class ShopLoadSuccess extends ShopState {
  final Cart cart;

  const ShopLoadSuccess(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'ShopLoadSuccess';
}

// ShopLoadFailure
class ShopLoadFailure extends ShopState {}
