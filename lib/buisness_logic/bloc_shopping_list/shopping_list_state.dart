part of 'shopping_list_bloc.dart';




@immutable
abstract class ShoppingListState {
  const ShoppingListState();
  List<Object> get props => [];
}

// ShoppingListInitial
class ShoppingListInitial extends ShoppingListState {}

// ShoppingListLoadInProgress
class ShoppingListLoadInProgress extends ShoppingListState {}

// ShoppingListLoadSuccess
class ShoppingListLoadSuccess extends ShoppingListState {
  final List<ShoppingList?> list;

  const ShoppingListLoadSuccess({required this.list});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'ShoppingListLoadSuccess';
}

// ShoppingListLoadFailure
class ShoppingListLoadFailure extends ShoppingListState {}
