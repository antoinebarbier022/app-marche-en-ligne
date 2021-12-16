part of '_repositories.dart';

class CartRepository{
CartRepository({Key? key});
  final _cartProvider = CartProvider();

  Future<List<Item?>> getItemsList(String idUser) async {
        return _cartProvider.getAllCartItems(idUser).get().then((snapshot){
          final List<Item?> items = [];
          for (var doc in snapshot.docs) {
            items.add(doc.data() as Item);
          }
          return items;
        });
  } 

    Future<void> addItemInCart(String idUser, Item newItem) async =>
      await _cartProvider.addItem(idUser, newItem);

  Future<void> deleteItemInCart(String idUser, String nameItem) async =>
      await _cartProvider.deleteItem(idUser, nameItem);

  Future<void> updateItemInCart(String idUser, String nameItem, double quantity) async =>
      await _cartProvider.updateItem(idUser, nameItem, quantity);


}