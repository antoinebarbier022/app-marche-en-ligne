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
    return CartProvider.getGroupCollection().doc(idUser).collection('items').withConverter<Cart>(
      fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
      toFirestore: (cart, _) => cart.toJson(),
    );
  }

}
