import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

/// Exemple de bloc pattern : https://bloclibrary.dev/#/fluttershoptutorial

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  //final ShopRepository shopRepository;

  ShoppingListBloc()
      : super(ShoppingListLoadSuccess([
          ShoppingList("Evening Shopping list", [
            Product("Carotte", 2.4, "Vegetables", "France"),
            Product("Tomate", 2.4, "Vegetables", "France"),
            Product("Concombre", 2.4, "Vegetables", "Espagne"),
            Product("Beterave", 2.4, "Vegetables", "Espagne"),
            Product("Avocat", 2.4, "Vegetables", "France"),
            Product("Salade", 2.4, "Vegetables", "France"),
            Product("Courgette", 2.4, "Vegetables", "France"),
            Product("Poivron", 2.4, "Vegetables", "Espagne"),
          ]),
          ShoppingList("Weekend Shopping list", []),
          ShoppingList("Favorite product", [])
        ]));

  @override
  Stream<ShoppingListState> mapEventToState(ShoppingListEvent event) async* {
    if (event is ShoppingListLoaded) {
      yield* _mapShopLoadedToState();
    } /*else if (event is ProductShoppingListAdded) {
      yield* _mapItemAddedToState(event);
    } else if (event is ProductShoppingListDeleted) {
      yield* _mapItemDeletedToState(event);
    }*/
  }

  Stream<ShoppingListState> _mapShopLoadedToState() async* {
    final List<ShoppingList> list;
    try {
      list = List.from((state as ShoppingListLoadSuccess).list);
      yield ShoppingListLoadSuccess(list);
    } catch (_) {
      yield ShoppingListLoadFailure();
    }
  }
/*
  Stream<ShoppingListState> _mapItemAddedToState(
      ProductShoppingListAdded event) async* {
    final List<Item> listItems;
    // Si l'item est deja présent, on ne l'ajoute pas

    if ((state as ShoppingListLoadSuccess)
        .cart
        .items
        .any((item) => item.product.name == event.item.product.name)) {
      print("L'item est déja dans le panier");
      listItems = List.from((state as ShoppingListLoadSuccess).cart.items);
    } else {
      listItems = List.from((state as ShoppingListLoadSuccess).cart.items)
        ..add(event.item);
    }
    final Cart updatedShop = Cart(listItems);
    print(updatedShop.items);
    yield ShoppingListLoadSuccess(updatedShop);
    //_saveShoppingList(updatedShop);
  }

  Stream<ShoppingListState> _mapItemDeletedToState(
      ProductShoppingListDeleted event) async* {
    if (state is ShoppingListLoadSuccess) {
      final List<Item> updatedShop = (state as ShoppingListLoadSuccess)
          .cart
          .items
          .where((element) => element.product.name != event.product.name)
          .toList();
      yield ShoppingListLoadSuccess(Cart(updatedShop));
      //_saveShoppingList(updatedShop);
    }
  }
*/
/*
  Future _saveShoppingList(List<Product> shop) {
    //return shopRepository.saveShop(shop.map((item) => item.toEntity()).toList(),);
    return ;
  }*/
}
