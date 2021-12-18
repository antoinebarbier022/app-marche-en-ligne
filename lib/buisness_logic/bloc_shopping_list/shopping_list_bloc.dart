import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/data/repositories/_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

/// Exemple de bloc pattern : https://bloclibrary.dev/#/fluttershoptutorial

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final ShoppingListRepository shoppingListRepository;

  ShoppingListBloc(this.shoppingListRepository) : super(ShoppingListInitial());

  @override
  Stream<ShoppingListState> mapEventToState(ShoppingListEvent event) async* {
    if (event is ShoppingListLoaded) {
      yield* _mapShoppingListLoadedToState(event);
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

  Stream<ShoppingListState> _mapShoppingListLoadedToState(
      ShoppingListLoaded event) async* {
    List<ShoppingList?> list;
    try {
      yield ShoppingListLoadInProgress();
      if (event.idUser != "") {
        try {
          list = await shoppingListRepository.getAllShoppingList(event.idUser);
        } catch (e) {
          print(e);
          list = [];
        }
      } else {
        if (state is ShoppingListLoadSuccess) {
          list = List.from((state as ShoppingListLoadSuccess).list);
        } else {
          list = [];
        }
      }

      yield ShoppingListLoadSuccess(list: list);
    } catch (_) {
      yield ShoppingListLoadFailure();
    }
  }

  Stream<ShoppingListState> _mapAddedShoppingListToState(
      ShoppingListAdded event) async* {
    final List<ShoppingList> updatedShoppingList;

    if ((state as ShoppingListLoadSuccess)
        .list
        .any((element) => element!.name == event.shoppingList.name)) {
      // le nom de cette liste existe déjà
      updatedShoppingList = List.from((state as ShoppingListLoadSuccess).list);
    } else {
      updatedShoppingList = List.from((state as ShoppingListLoadSuccess).list)
        ..add(event.shoppingList);
    }

    // add to firebase
    if (event.idUser != "") {
      shoppingListRepository.addShoppingList(event.idUser, event.shoppingList);
    }
    yield ShoppingListLoadSuccess(list: updatedShoppingList);
  }

  Stream<ShoppingListState> _mapDeletedShoppingListToState(
      ShoppingListDeleted event) async* {
    final List<ShoppingList?> updatedShoppingList =
        (state as ShoppingListLoadSuccess)
            .list
            .where((element) => element!.name != event.shoppingList.name)
            .toList();
    // delete to firebase
    if (event.idUser != "") {
      shoppingListRepository.deleteShoppingList(
          event.idUser, event.shoppingList);
    }
    yield ShoppingListLoadSuccess(list: updatedShoppingList);
  }

  Stream<ShoppingListState> _mapProductAddedShoppingListToState(
      ShoppingListProductAdded event) async* {
    final List<ShoppingList> updatedShoppingList =
        List.from((state as ShoppingListLoadSuccess).list);

    int index = (state as ShoppingListLoadSuccess)
        .list
        .indexWhere((element) => element!.name == event.shoppingListName);

    // Si la list ne contient déja le produit on le rajoute
    if (!updatedShoppingList[index].products.contains(event.product)) {
      updatedShoppingList[index].products.add(event.product);
      // add product to firebase
    }

    //
    if (event.idUser != "") {
      shoppingListRepository.updateShoppingList(
          event.idUser, updatedShoppingList[index]);
    }

    yield ShoppingListLoadSuccess(list: updatedShoppingList);
  }

  Stream<ShoppingListState> _mapProductDeletedShoppingListToState(
      ShoppingListProductDeleted event) async* {
    final List<ShoppingList> updatedShoppingList =
        List.from((state as ShoppingListLoadSuccess).list);

    int index = (state as ShoppingListLoadSuccess)
        .list
        .indexWhere((element) => element!.name == event.shoppingListName);

    // on charge la liste qui ne contient pas le produit supprimé
    updatedShoppingList[index].products = (state as ShoppingListLoadSuccess)
        .list[index]!
        .products
        .where((element) => element!.name != event.product.name)
        .toList();
    // delete product to firebase (update shopping list)
    if (event.idUser != "") {
      shoppingListRepository.updateShoppingList(
          event.idUser, updatedShoppingList[index]);
    }

    yield ShoppingListLoadSuccess(list: updatedShoppingList);
    //_saveShop(updatedShop);
  }
}
