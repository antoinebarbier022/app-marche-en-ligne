import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

/// Exemple de bloc pattern : https://bloclibrary.dev/#/fluttershoptutorial

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  //final ShopRepository shopRepository;

  ShopBloc() : super(ShopLoadSuccess(Cart([])));

  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is ShopLoaded) {
      yield* _mapShopLoadedToState();
    } else if (event is ItemAdded) {
      yield* _mapItemAddedToState(event);
    } else if (event is ItemUpdated) {
      yield* _mapItemUpdatedToState(event);
    } else if (event is ItemDeleted) {
      yield* _mapItemDeletedToState(event);
    } else if (event is ClearShop) {
      yield* _mapClearShopToState();
    }
  }

  Stream<ShopState> _mapShopLoadedToState() async* {
    final cart;
    try {
      if (state is ShopLoadSuccess) {
        cart = Cart(List.from((state as ShopLoadSuccess).cart.items));
      } else {
        cart = Cart([]);
      }

      print("ok");
      yield ShopLoadSuccess(cart);
    } catch (_) {
      print("aiiie");
      yield ShopLoadFailure();
    }
  }

  Stream<ShopState> _mapItemAddedToState(ItemAdded event) async* {
    final List<Item> listItems;
    // Si l'item est deja présent, on ne l'ajoute pas
    
    if ((state as ShopLoadSuccess)
        .cart
        .items
        .any((item) => item.product.name == event.item.product.name)) {
      print("L'item est déja dans le panier, on rajoute donc la quantité selectionné en plus");
      listItems = List.from((state as ShopLoadSuccess).cart.items);
      listItems[listItems.indexWhere((item) => item.product.name == event.item.product.name)].quantity += event.item.quantity;
    } else {
      listItems = List.from((state as ShopLoadSuccess).cart.items)
        ..add(event.item);
    }
    final Cart updatedShop = Cart(listItems);
    print(updatedShop.items);
    yield ShopLoadSuccess(updatedShop);
    //_saveShop(updatedShop);
  }

  Stream<ShopState> _mapItemUpdatedToState(ItemUpdated event) async* {
    if (state is ShopLoadSuccess) {
      final List<Item> listItems =
          (state as ShopLoadSuccess).cart.items.map((element) {
        return element.product.name == event.item.product.name
            ? event.item
            : element;
      }).toList();

      final Cart updatedShop = Cart(listItems);

      yield ShopLoadSuccess(updatedShop);
      //_saveShop(updatedShop);
    }
  }

  Stream<ShopState> _mapItemDeletedToState(ItemDeleted event) async* {
    if (state is ShopLoadSuccess) {
      final List<Item> updatedShop = (state as ShopLoadSuccess)
          .cart
          .items
          .where((element) => element.product.name != event.product.name)
          .toList();
      yield ShopLoadSuccess(Cart(updatedShop));
      //_saveShop(updatedShop);
    }
  }

  Stream<ShopState> _mapClearShopToState() async* {
    if (state is ShopLoadSuccess) {
      yield ShopLoadSuccess(Cart([]));
      //_saveShop(updatedShop);
    }
  }

/*
  Future _saveShop(List<Product> shop) {
    //return shopRepository.saveShop(shop.map((item) => item.toEntity()).toList(),);
    return ;
  }*/
}
