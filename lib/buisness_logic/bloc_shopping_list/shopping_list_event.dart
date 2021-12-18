part of 'shopping_list_bloc.dart';

@immutable
abstract class ShoppingListEvent {
  const ShoppingListEvent();

  List<Object> get props => [];
}

// All Shopping list chargé
class ShoppingListLoaded extends ShoppingListEvent {
  final String idUser;
  const ShoppingListLoaded({ this.idUser = ""});

  @override
  List<Object> get props => [idUser];
}

// Shopping list créée
class ShoppingListAdded extends ShoppingListEvent {
  final String idUser;
  final ShoppingList shoppingList;

  const ShoppingListAdded({required this.shoppingList, this.idUser = ""});

  @override
  List<Object> get props => [shoppingList, idUser];

  @override
  String toString() =>
      'ShoppingListAdded { shopping list: ${shoppingList.name}}';
}

// Suppression de la shopping liste
class ShoppingListDeleted extends ShoppingListEvent {
  final String idUser;
  final ShoppingList shoppingList;

  const ShoppingListDeleted({required this.shoppingList, this.idUser = ""});

  @override
  List<Object> get props => [shoppingList, idUser];
}

// Ajouter un produit dans une shopping list

class ShoppingListProductAdded extends ShoppingListEvent {
  final String idUser;
  final String shoppingListName;
  final Product? product;

  const ShoppingListProductAdded(
      {required this.shoppingListName,
      required this.product,
      this.idUser = ""});

  @override
  List<Object> get props => [shoppingListName, product as Object];

  @override
  String toString() => 'ShoppingListProductAdded { product: ${product!.name}}';
}

// Supprimer un produit de la shopping list
class ShoppingListProductDeleted extends ShoppingListEvent {
  final String idUser;
  final String shoppingListName;
  final Product product;

  const ShoppingListProductDeleted(
      {required this.shoppingListName,
      required this.product,
      this.idUser = ""});

  @override
  List<Object> get props => [shoppingListName, product, idUser];

  @override
  String toString() => 'ProductDeleted { product: $product }';
}
