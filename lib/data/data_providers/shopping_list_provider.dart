part of '_data_providers.dart';

class ShoppingListProvider {

  // --- COLLECTION REFERENCE ---
  static CollectionReference getGroupCollection() {
    return firestore.collection('shoppingLists');
  }

  // --- GET ALL shopping list---
  Query getAllShoppingList(String idUser) { // .where("idUser", isEqualTo: idUser)
    return ShoppingListProvider.getGroupCollection().withConverter<ShoppingList>(
      fromFirestore: (snapshot, _) => ShoppingList.fromJson(snapshot.data()!),
      toFirestore: (shoppingList, _) => shoppingList.toJson(),
    );
  }

    // --- ADD Shopping List ---
  Future<void> addShoppingList(String idUser, ShoppingList shoppingList) async {
    return ShoppingListProvider.getGroupCollection()
        .doc(shoppingList.name + "-" + idUser).set(shoppingList.toJson());
  }

  // --- Update Shopping List ---
  Future<void> updateShoppingList(String idUser, ShoppingList shoppingList) async {
    return ShoppingListProvider.getGroupCollection()
        .doc(shoppingList.name + "-" + idUser).set(shoppingList.toJson());
  }

  // --- DELETE Shopping List ---
  Future<void> deleteShoppingList(String idUser, ShoppingList shoppingList) async {
    return ShoppingListProvider.getGroupCollection()
        .doc(shoppingList.name + "-" + idUser).delete();
  }

  // --- ADD product ---
  Future<void> addProductToShoppingList(String idUser, String shoppingListName, Product newProduct) async {
    return ShoppingListProvider.getGroupCollection()
        .doc(shoppingListName + "-" + idUser)
        .set(newProduct.toJson());
  }

  // --- Delete product ---
  Future<void> deleteProductFromShoppingList(String idUser, String shoppingListName, String productName) async {
    return ShoppingListProvider.getGroupCollection()
        .doc(shoppingListName + "-" + idUser)
        .delete();
  }
}
