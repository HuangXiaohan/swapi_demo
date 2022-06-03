part of 'category_bloc.dart';

abstract class CategoryEvent {}

class CategoryReceiveDataEvent extends CategoryEvent {
  final List<Category> categoryList;

  CategoryReceiveDataEvent(this.categoryList);
}

class CategoryDeactivateLoadAnimationEvent extends CategoryEvent {}
