part of 'departement_bloc.dart';

@immutable
abstract class DepartementState {}

class DepartementsInitial extends DepartementState {}

class DepartementsLoaded extends DepartementState {
  final List<Departement> departements;

  DepartementsLoaded({required this.departements});
}

class DepartementsLoading extends DepartementState {}

class DepartementsNotLoaded extends DepartementState {}
