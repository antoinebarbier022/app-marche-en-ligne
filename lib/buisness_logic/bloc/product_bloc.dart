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
        Product(name: "Carotte", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Tomate", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Concombre", price: 2.4, departement: "Vegetables", category: "Espagne"),
        Product(name: "Beterave", price: 2.4, departement: "Vegetables", category: "Espagne"),
        Product(name: "Avocat", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Salade", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Courgette", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Poivron", price: 2.4, departement: "Vegetables", category: "Espagne"),
        Product(name: "Pommes de terre", price: 2.4, departement: "Vegetables", category: "France"),
        Product(name: "Choux", price: 2.4, departement: "Vegetables", category: "Espagne"),
        // fruits
        Product(name: "Pomme", price: 2.4, departement: "Fruits", category: "France"),
        Product(name: "Banane", price: 2.4, departement: "Fruits", category: "France"),
        Product(name: "Cerise", price: 2.4, departement: "Fruits", category: "Espagne"),
        Product(name: "Mangue", price: 2.4, departement: "Fruits", category: "Espagne"),
        // meats
        Product(name: "Porc 100g", price: 2.4, departement: "Meat", category: "Pork"),
        Product(name: "Porc 200g", price: 2.4, departement: "Meat", category: "Pork"),
        Product(name: "Boeuf 100g", price: 2.4, departement: "Meat", category: "Beef"),
        Product(name: "Boeuf 200g", price: 2.4, departement: "Meat", category: "Beef"),
        Product(name: "Poulet 100g", price: 2.4, departement: "Meat", category: "Chicken"),
        Product(name: "Cuisse de poulet 200g", price: 2.4, departement: "Meat", category: "Chicken")
      ];
      yield ProductsLoaded(products: newState);
    } else {
      yield ProductsNotLoaded();
    }
  }
}
