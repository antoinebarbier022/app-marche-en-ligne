import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/data/repositories/_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

/// Exemple de bloc pattern : https://bloclibrary.dev/#/fluttershoptutorial

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  CartRepository cartRepository;

  ShopBloc(this.cartRepository) : super(ShopInitial());

  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is ShopLoaded) {
      yield* _mapShopLoadedToState(event);
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

  Stream<ShopState> _mapShopLoadedToState(ShopLoaded event) async* {
    try {
      yield ShopLoadInProgress();
      List<Item?> items;
      // si l'utilisateur est connecté on lui donne sont panier
      if (event.idUser != "") {
         items = await cartRepository.getItemsList(event.idUser);
      }else{
        if (state is ShopLoadSuccess) {
        items = List.from((state as ShopLoadSuccess).cart.items);
      } else {
        items = [];
      }
        
      }
      yield ShopLoadSuccess(Cart(items: items));
    } catch (_) {
      yield ShopLoadFailure();
    }
  }

  Stream<ShopState> _mapItemAddedToState(ItemAdded event) async* {
    final List<Item> listItems;
    print("user");
    print(event.idUser);
    // Si l'item est deja présent, on ne l'ajoute pas
    if ((state as ShopLoadSuccess)
        .cart
        .items
        .any((item) => item!.product!.name == event.item.product!.name)) {
      listItems = List.from((state as ShopLoadSuccess).cart.items);
      double newQuantity = (listItems[listItems.indexWhere(
              (item) => item.product!.name == event.item.product!.name)]
          .quantity += event.item.quantity);
      // Ajout dans firebase si l'utilisateur est connecté
      if (event.idUser != "") {
        cartRepository.updateItemInCart(
            event.idUser, event.item.product!.name, newQuantity);
      }
    } else {
      // Ajout dans firebase si l'utilisateur est connecté
      if (event.idUser != "") {
        cartRepository.addItemInCart(
            event.idUser, Item(product: event.item.product, quantity: 1));
      }
      listItems = List.from((state as ShopLoadSuccess).cart.items)
        ..add(event.item);
    }
    final Cart updatedShop = Cart(items: listItems);

    yield ShopLoadSuccess(updatedShop);
    
    //_saveShop(updatedShop);
  }

  Stream<ShopState> _mapItemUpdatedToState(ItemUpdated event) async* {
    if (state is ShopLoadSuccess) {
      final List<Item?> listItems =
          (state as ShopLoadSuccess).cart.items.map((element) {
        return element!.product!.name == event.item.product!.name
            ? event.item
            : element;
      }).toList();

      final Cart updatedShop = Cart(items: listItems);

      yield ShopLoadSuccess(updatedShop);
      //_saveShop(updatedShop);
      // MAJ quantité
      if (event.idUser != "") {
        if (event.item.quantity >= 1) {
          cartRepository.addItemInCart(event.idUser,
              Item(product: event.item.product, quantity: event.item.quantity));
        } else {
          cartRepository.deleteItemInCart(
            event.idUser,
            event.item.product!.name,
          );
        }
      }
    }
  }

  Stream<ShopState> _mapItemDeletedToState(ItemDeleted event) async* {
    if (state is ShopLoadSuccess) {
      final List<Item?> updatedShop = (state as ShopLoadSuccess)
          .cart
          .items
          .where((element) => element!.product!.name != event.product!.name)
          .toList();
      
      if (event.idUser != "") {
        print("clear "+ event.product!.name);
        cartRepository.deleteItemInCart(
          event.idUser,
          event.product!.name,
        );
      }
      yield ShopLoadSuccess(Cart(items: updatedShop));
      // delete dans firebase
      

      //_saveShop(updatedShop);
    }
  }

  Stream<ShopState> _mapClearShopToState() async* {
    if (state is ShopLoadSuccess) {
      yield ShopLoadSuccess(Cart(items: []));
      //_saveShop(updatedShop);
    }
  }

/*
  Future _saveShop(List<Product> shop) {
    //return shopRepository.saveShop(shop.map((item) => item.toEntity()).toList(),);
    return ;
  }*/
}
