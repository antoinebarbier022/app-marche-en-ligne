part of '_repositories.dart';

class CartRepository{
CartRepository({Key? key});
  final _cartProvider = CartProvider();

    Future<void> addItemInCart(String idUser, Item newItem) async =>
      await _cartProvider.addItem(idUser, newItem);

  Future<void> deleteItemInCart(String idUser, String nameItem) async =>
      await _cartProvider.deleteItem(idUser, nameItem);

  Future<void> updateItemInCart(String idUser, String nameItem, double quantity) async =>
      await _cartProvider.updateItem(idUser, nameItem, quantity);


}