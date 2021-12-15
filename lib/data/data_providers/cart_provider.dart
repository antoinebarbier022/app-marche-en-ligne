part of '_data_providers.dart';

class CartProvider {
  // --- COLLECTION REFERENCE ---
  static CollectionReference getGroupCollection() {
    return firestore.collection('carts');
  }

  // --- GET Cart---
  Future<DocumentSnapshot<Object?>> getCart(String idUser) {
    return CartProvider.getGroupCollection().doc(idUser).get();
  }

  // --- GET ALL items in cart ---
  Query getAllCartItems(String idUser) {
    return CartProvider.getGroupCollection()
        .doc(idUser)
        .collection('items')
        .withConverter<Cart>(
          fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
          toFirestore: (cart, _) => cart.toJson(),
        );
  }

  // --- ADD ---
  Future<void> addItem(String idUser, Item newItem) async {
    return CartProvider.getGroupCollection()
        .doc(idUser)
        .collection('items')
        .doc(newItem.product!.name)
        .set(newItem.toJson());
  }

// UPDATE
  Future<void> updateItem(String idUser,  String nameItem, double quantity) async {
    return CartProvider.getGroupCollection()
        .doc(idUser)
        .collection('items')
        .doc(nameItem).update({"quantity": quantity});
  }

  // --- Delete ---
  Future<void> deleteItem(String idUser, String nameItem) async {
    return CartProvider.getGroupCollection()
        .doc(idUser)
        .collection('items')
        .doc(nameItem)
        .delete();
  }
}
