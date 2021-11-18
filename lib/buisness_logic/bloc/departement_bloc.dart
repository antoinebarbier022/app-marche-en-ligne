import 'package:app_market_online/config/theme.dart';
import 'package:app_market_online/data/models/_models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'departement_event.dart';
part 'departement_state.dart';

class DepartementBloc extends Bloc<DepartementEvent, DepartementState> {
  DepartementBloc() : super(DepartementsInitial());

  @override
  Stream<DepartementState> mapEventToState(DepartementEvent event) async* {
    if (event is GetAllDepartements) {
      // chargement des produits
      yield DepartementsLoading();
      List<Departement> newState = [
        Departement("Popular", "", AppColors.blue),
        Departement("Vegetables", "",AppColors.green),
        Departement("Fruits", "",AppColors.yellow),
        Departement("Meat", "",AppColors.red),
      ];
      yield DepartementsLoaded(departements: newState);
    } else {
      yield DepartementsNotLoaded();
    }
  }
}
