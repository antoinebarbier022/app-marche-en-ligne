part of 'shopping_list_bloc.dart';



@immutable
abstract class ShoppingListEvent {
  const ShoppingListEvent();

  List<Object> get props => [];
}

// All Shopping list chargé
class ShoppingListLoaded extends ShoppingListEvent {
final List<ShoppingList> list;

  const ShoppingListLoaded(this.list);

  @override
  List<Object> get props => [list];

}

// Shopping list créée
class ShoppingListAdded extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const ShoppingListAdded(this.shoppingList);

  @override
  List<Object> get props => [shoppingList];

  @override
  String toString() => 'ShoppingListAdded { shopping list: ${shoppingList.name}}';
}

// Suppression de la shopping liste
class ShoppingListDeleted extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const ShoppingListDeleted(this.shoppingList);

  @override
  List<Object> get props => [shoppingList];
}

// Ajouter un produit dans une shopping list

class ShoppingListProductAdded extends ShoppingListEvent {
  final String shoppingListName;
  final Product product;

  const ShoppingListProductAdded(this.shoppingListName, this.product);

  @override
  List<Object> get props => [shoppingListName, product];

  @override
  String toString() => 'ShoppingListProductAdded { product: ${product.name}}';
}
