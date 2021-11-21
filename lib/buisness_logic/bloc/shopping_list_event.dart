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

// Produit ajouté dans la shopping list
class ProductShoppingListAdded extends ShoppingListEvent {
  final Product product;

  const ProductShoppingListAdded(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ProductShoppingListAdded { product: ${product.name}}';
}

// Produit supprimé dans la shopping list
class ProductShoppingListDeleted extends ShoppingListEvent {
  final Product product;

  const ProductShoppingListDeleted(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ProductShoppingListDeleted { product: ${product.name}}';
}

// Suppression de la shopping liste
class ShoppingListDeleted extends ShoppingListEvent {}


