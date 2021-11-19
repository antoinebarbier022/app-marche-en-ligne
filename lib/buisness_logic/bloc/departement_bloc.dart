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
        Departement("Popular", "star", AppColors.brown, []),
        Departement("Meat", "meat", AppColors.red, [Category("Pork"),Category("Chicken"),Category("Beef")]),
        Departement("Fruits", "fruits", AppColors.green, [Category("France"),Category("Espagne")]),
        Departement("Grains & Pasta", "grains", AppColors.orange, []),
        Departement("Vegetables", "vegetables", AppColors.green, [Category("France"),Category("Espagne")]),
        Departement("Cheese", "cheese", AppColors.blue, []),
        Departement("Bakery & Pastry", "bakery", AppColors.yellow, []),
        Departement("Seafood", "fish", AppColors.blue, []),
        Departement("Dairy & Eggs", "dairy", AppColors.purple, []),
        Departement("Nuts & Seeds", "nuts", AppColors.brown, []),
        Departement("Beverages", "beverages", AppColors.green, []),
        Departement("Japan food", "sushi", AppColors.orange, []),
      ];

      yield DepartementsLoaded(departements: newState);
    } else {
      yield DepartementsNotLoaded();
    }
  }
}
