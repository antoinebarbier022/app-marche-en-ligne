import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductsInitial());
  ProductState get initialState => ProductsInitial();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetAllProducts) {
      // chargement des produits
      yield ProductsLoading();
      List<Product> newState = [
    Product("Pomme", 2.4, Colors.green[100]),
    Product("Banane", 5, Colors.yellow[200]),
    Product("Cerise", 2.4, Colors.red[200]),
    Product("Mangue", 2.4, Colors.yellow[200]),
    Product("Orange", 2.4, Colors.orange[200])];
      yield ProductsLoaded(products: newState);

    } else {
      yield ProductsNotLoaded();
    }
  }
}
