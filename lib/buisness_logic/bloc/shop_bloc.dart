import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

/// Exemple de bloc pattern : https://bloclibrary.dev/#/fluttershoptutorial

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  //final ShopRepository shopRepository;

  ShopBloc() : super(ShopLoadInProgress());

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
    try {

      final cart = Cart(List.from((state as ShopLoadSuccess).cart.items));
      print("ok");
      yield ShopLoadSuccess(cart);
    } catch (_) {
      print("aiiie");
      yield ShopLoadFailure();
    }
  }

  Stream<ShopState> _mapItemAddedToState(ItemAdded event) async* {
    if (state is ShopLoadSuccess) {
      print("Ajout d'un item");
      final List<Item> listItems =
          List.from((state as ShopLoadSuccess).cart.items)..add(Item(event.product, 1));
      final Cart updatedShop = Cart(listItems);
      print(updatedShop.items);
      yield ShopLoadSuccess(updatedShop);
      //_saveShop(updatedShop);
    }
  }

  Stream<ShopState> _mapItemUpdatedToState(ItemUpdated event) async* {
    if (state is ShopLoadSuccess) {
      

      
      final List<Item> listItems =
          (state as ShopLoadSuccess).cart.items.map( (element) {
            return element.product.name == event.item.product.name ? event.item : element;
          } ).toList();

      final Cart updatedShop = Cart(listItems);
          
      yield ShopLoadSuccess(updatedShop);
      //_saveShop(updatedShop);
    }
  }

  Stream<ShopState> _mapItemDeletedToState(ItemDeleted event) async* {
    if (state is ShopLoadSuccess) {
      final Cart updatedShop = (state as ShopLoadSuccess)
          .cart.items.remove(event.product) as Cart;
      yield ShopLoadSuccess(updatedShop);
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