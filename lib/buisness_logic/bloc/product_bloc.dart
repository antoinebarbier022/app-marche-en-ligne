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
        // vegetables
        Product("Carotte", 2.4, "Vegetables", "France"),
        Product("Tomate", 2.4, "Vegetables", "France"),
        Product("Concombre", 2.4, "Vegetables", "Espagne"),
        Product("Beterave", 2.4, "Vegetables", "Espagne"),
        Product("Avocat", 2.4, "Vegetables", "France"),
        Product("Salade", 2.4, "Vegetables", "France"),
        Product("Courgette", 2.4, "Vegetables", "France"),
        Product("Poivron", 2.4, "Vegetables", "Espagne"),
        Product("Pommes de terre", 2.4, "Vegetables", "France"),
        Product("Choux", 2.4, "Vegetables", "Espagne"),
        // fruits
        Product("Pomme", 2.4, "Fruits", "France"),
        Product("Banane", 5, "Fruits", "France"),
        Product("Cerise", 2.4, "Fruits", "Espagne"),
        Product("Mangue", 2.4, "Fruits", "Espagne"),
        // meats
        Product("Porc 100g", 2.4, "Meat", "Pork"),
        Product("Porc 200g", 2.4, "Meat", "Pork"),
        Product("Boeuf 100g", 2.4, "Meat", "Beef"),
        Product("Boeuf 200g", 2.4, "Meat", "Beef"),
        Product("Poulet 100g", 2.4, "Meat", "Chicken"),
        Product("Cuisse de poulet 200g", 2.4, "Meat", "Chicken")
      ];
      yield ProductsLoaded(products: newState);
    } else {
      yield ProductsNotLoaded();
    }
  }
}
