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
          ShoppingList("Evening Shopping list", []),
          ShoppingList("Weekend Shopping list", []),
          ShoppingList("Favorite product", [])
        ]));

  @override
  Stream<ShoppingListState> mapEventToState(ShoppingListEvent event) async* {
    if (event is ShoppingListLoaded) {
      yield* _mapShoppingListLoadedToState();
      // Ajout d'une nouvelle shopping list
    } else if (event is ShoppingListAdded) {
      yield* _mapAddedShoppingListToState(event);
      // Suppression d'une shopping list
    } else if (event is ShoppingListDeleted) {
      yield* _mapDeletedShoppingListToState(event);
      // Ajout d'un produit dans une shopping list
    } else if (event is ShoppingListProductAdded) {
      yield* _mapProductAddedShoppingListToState(event);
      // Suppression d'un produit dans une shopping list
    } else if (event is ShoppingListProductDeleted) {
      yield* _mapProductDeletedShoppingListToState(event);
    }
  }

  Stream<ShoppingListState> _mapShoppingListLoadedToState() async* {
    final List<ShoppingList> list;
    try {
      list = List.from((state as ShoppingListLoadSuccess).list);
      yield ShoppingListLoadSuccess(list);
    } catch (_) {
      yield ShoppingListLoadFailure();
    }
  }

  Stream<ShoppingListState> _mapAddedShoppingListToState(
      ShoppingListAdded event) async* {
    final List<ShoppingList> updatedShoppingList;
    if ((state as ShoppingListLoadSuccess)
        .list
        .any((element) => element.name == event.shoppingList.name)) {
          // le nom de cette liste existe déjà
      updatedShoppingList = List.from((state as ShoppingListLoadSuccess).list);
    } else {
      updatedShoppingList = List.from((state as ShoppingListLoadSuccess).list)
        ..add(event.shoppingList);
    }

    yield ShoppingListLoadSuccess(updatedShoppingList);
  }

  Stream<ShoppingListState> _mapDeletedShoppingListToState(
      ShoppingListDeleted event) async* {
    final List<ShoppingList> updatedShoppingList =
        (state as ShoppingListLoadSuccess)
            .list
            .where((element) => element.name != event.shoppingList.name)
            .toList();
    yield ShoppingListLoadSuccess(updatedShoppingList);
  }

  Stream<ShoppingListState> _mapProductAddedShoppingListToState(
      ShoppingListProductAdded event) async* {
    final List<ShoppingList> updatedShoppingList =
        List.from((state as ShoppingListLoadSuccess).list);

    int index = (state as ShoppingListLoadSuccess)
        .list
        .indexWhere((element) => element.name == event.shoppingListName);

    // Si la list ne contient déja le produit on le rajoute
    if (!updatedShoppingList[index].products.contains(event.product)) {
      updatedShoppingList[index].products.add(event.product);
    }
    yield ShoppingListLoadSuccess(updatedShoppingList);
  }

  Stream<ShoppingListState> _mapProductDeletedShoppingListToState(
      ShoppingListProductDeleted event) async* {
    
      final List<ShoppingList> updatedShoppingList =
          List.from((state as ShoppingListLoadSuccess).list);

      int index = (state as ShoppingListLoadSuccess)
          .list
          .indexWhere((element) => element.name == event.shoppingListName);

      // on charge la liste qui ne contient pas le produit supprimé
      updatedShoppingList[index].products = (state as ShoppingListLoadSuccess)
          .list[index]
          .products
          .where((element) => element.name != event.product.name)
          .toList();
      yield ShoppingListLoadSuccess(updatedShoppingList);
      //_saveShop(updatedShop);
    }
  
}
