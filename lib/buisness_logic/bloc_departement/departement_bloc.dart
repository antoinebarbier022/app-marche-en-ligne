import 'package:app_market_online/config/theme.dart';
import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'departement_event.dart';
part 'departement_state.dart';

class DepartementBloc extends Bloc<DepartementEvent, DepartementState> {
  DepartementBloc() : super(DepartementsInitial());
  DepartementState get initialState => DepartementsInitial();

  @override
  Stream<DepartementState> mapEventToState(DepartementEvent event) async* {
    if (event is GetAllDepartements) {
      // chargement des produits
      yield DepartementsLoading();
      List<Departement> newState = [
        Departement(name :"Popular", image: "star", color: AppColors.brown, categories :[]),
        Departement(name :"Meat", image: "meat", color: AppColors.red, categories :[Category("Pork"),Category("Chicken"),Category("Beef")]),
        Departement(name :"Fruits", image: "fruits", color: AppColors.green, categories :[Category("France"),Category("Espagne")]),
        Departement(name :"Grains & Pasta", image: "grains", color: AppColors.orange, categories :[]),
        Departement(name :"Vegetables", image: "vegetables", color: AppColors.green, categories :[Category("France"),Category("Espagne"),Category("Chine")]),
        Departement(name :"Cheese", image: "cheese", color: AppColors.blue, categories :[Category("France")]),
        Departement(name :"Bakery & Pastry", image: "bakery", color: AppColors.yellow, categories :[]),
        Departement(name :"Seafood", image: "fish", color: AppColors.blue, categories :[]),
        Departement(name :"Dairy & Eggs",image:  "dairy", color: AppColors.purple, categories :[]),
        Departement(name :"Nuts & Seeds", image: "nuts", color: AppColors.brown, categories :[]),
        Departement(name :"Beverages", image: "beverages", color: AppColors.green, categories :[]),
        Departement(name :"Japan food", image: "sushi", color: AppColors.orange, categories :[]),
      ];

      yield DepartementsLoaded(departements: newState);
    } else {
      yield DepartementsNotLoaded();
    }
  }
}
