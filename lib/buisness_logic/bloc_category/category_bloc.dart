import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/data/repositories/_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository repository;

  CategoryBloc(this.repository) : super(CategoriesInitial());
  CategoryState get initialState => CategoriesInitial();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is GetAllCategories) {
      // chargement des produits
      yield CategoriesLoading();
      List<Category?> newState = await repository.getCategoriesList();
      print(newState);
      /*[
        Category(name :"Popular", image: "star", color: AppColors.brown, categories :[]),
        Category(name :"Meat", image: "meat", color: AppColors.red, categories :[Category("Pork"),Category("Chicken"),Category("Beef")]),
        Category(name :"Fruits", image: "fruits", color: AppColors.green, categories :[Category("France"),Category("Espagne")]),
        Category(name :"Grains & Pasta", image: "grains", color: AppColors.orange, categories :[]),
        Category(name :"Vegetables", image: "vegetables", color: AppColors.green, categories :[Category("France"),Category("Espagne"),Category("Chine")]),
        Category(name :"Cheese", image: "cheese", color: AppColors.blue, categories :[Category("France")]),
        Category(name :"Bakery & Pastry", image: "bakery", color: AppColors.yellow, categories :[]),
        Category(name :"Seafood", image: "fish", color: AppColors.blue, categories :[]),
        Category(name :"Dairy & Eggs",image:  "dairy", color: AppColors.purple, categories :[]),
        Category(name :"Nuts & Seeds", image: "nuts", color: AppColors.brown, categories :[]),
        Category(name :"Beverages", image: "beverages", color: AppColors.green, categories :[]),
        Category(name :"Japan food", image: "sushi", color: AppColors.orange, categories :[]),
      ];*/

      yield CategoriesLoaded(categories: newState);
    } else {
      yield CategoriesNotLoaded();
    }
  }
}
