part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoriesInitial extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category?> categories;

  CategoriesLoaded({required this.categories});
}

class CategoriesLoading extends CategoryState {}

class CategoriesNotLoaded extends CategoryState {}
