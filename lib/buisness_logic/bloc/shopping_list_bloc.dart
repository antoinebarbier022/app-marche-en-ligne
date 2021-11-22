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
            Product("Carottes", 2.4, "Vegetables", "France"),
            Product("Tomates", 2.4, "Vegetables", "France"),
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
      yield* _mapShoppingListLoadedToState();
    } else if (event is ShoppingListAdded) {
      yield* _mapAddedShoppingListToState(event);
    } else if (event is ShoppingListDeleted) {
      yield* _mapDeletedShoppingListToState(event);
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
      print("Le nom de cette liste existe déjà");
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
}
