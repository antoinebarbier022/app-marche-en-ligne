part of '_repositories.dart';

class ShoppingListRepository {
  ShoppingListRepository({Key? key});
  final _shoppingListProvider = ShoppingListProvider();

// get all shopping list from user
  Future<List<ShoppingList?>> getAllShoppingList(String idUser) async {
        return _shoppingListProvider.getAllShoppingList(idUser).get().then((snapshot){
          final List<ShoppingList?> shoppingLists = [];
          for (var doc in snapshot.docs) {
            shoppingLists.add(doc.data() as ShoppingList);
          }
          return shoppingLists;
        });
  } 
  // add
  Future<void> addShoppingList(
          String idUser, ShoppingList shoppingList) async =>
      await _shoppingListProvider.addShoppingList(idUser, shoppingList);

  // update
  Future<void> updateShoppingList(
          String idUser, ShoppingList shoppingList) async =>
      await _shoppingListProvider.addShoppingList(idUser, shoppingList);

  // delete
  Future<void> deleteShoppingList(
          String idUser, ShoppingList shoppingList) async =>
      await _shoppingListProvider.deleteShoppingList(idUser, shoppingList);

  Future<void> addProductToShoppingList(
          String idUser, String shoppingListName, Product newProduct) async =>
      await _shoppingListProvider.addProductToShoppingList(
          idUser, shoppingListName, newProduct);

  Future<void> deleteProductFromShoppingList(
          String idUser, String shoppingListName, String productName) async =>
      await _shoppingListProvider.deleteProductFromShoppingList(
          idUser, shoppingListName, productName);
}
