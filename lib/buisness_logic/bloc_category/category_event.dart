part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetAllCategories extends CategoryEvent {
  GetAllCategories();
}