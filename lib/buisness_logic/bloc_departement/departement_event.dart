part of 'departement_bloc.dart';

@immutable
abstract class DepartementEvent {}

class GetAllDepartements extends DepartementEvent {
  GetAllDepartements();
}