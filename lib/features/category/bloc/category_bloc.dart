import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/services/root_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final RootService _rootService = GetIt.I<RootService>();

  CategoryBloc() : super(CategoryState()) {
    on<CategoryReceiveDataEvent>(_onReceiveData);
    on<CategoryDeactivateLoadAnimationEvent>(_onDeactivateAnimation);

    _firstFetch();
  }

  Future<void> _firstFetch() async {
    var categoryList = await _rootService.getCategories();
    add(CategoryReceiveDataEvent(categoryList));
  }

  Future<void> _onReceiveData(CategoryReceiveDataEvent event, Emitter emitter) async {
    emitter(state.copyWith(categoryList: event.categoryList));
    await Future.delayed(const Duration(seconds: 3));
    add(CategoryDeactivateLoadAnimationEvent());
  }

  void _onDeactivateAnimation(CategoryDeactivateLoadAnimationEvent _, Emitter emitter) {
    emitter(state.copyWith(loadAnimation: false));
  }
}
