part of 'category_bloc.dart';

class CategoryState {
  List<Category>? categoryList;
  bool loadAnimation;

  CategoryState({this.categoryList, this.loadAnimation = true});

  CategoryState copyWith({List<Category>? categoryList, bool? loadAnimation}) {
    return CategoryState(
        categoryList: categoryList ?? this.categoryList, loadAnimation: loadAnimation ?? this.loadAnimation);
  }
}
