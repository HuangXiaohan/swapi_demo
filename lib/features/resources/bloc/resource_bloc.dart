import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/models/resource.dart';

part 'resource_event.dart';
part 'resource_state.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState> {
  final Future initFuture;

  ResourceBloc({required this.initFuture}) : super(ResourceState(initFuture: initFuture)) {
    on<ResourceReceiveDataEvent>(_onReceiveData);
    on<ResourceLoadNextDataEvent>(_onLoadNextData);
    on<ResourceLoadingEvent>(_onLoading);

    _firstFetch();
  }

  Future<void> _firstFetch() async {
    var resource = await state.initFuture;
    add(ResourceReceiveDataEvent(resource));
  }

  Future<void> _onReceiveData(ResourceReceiveDataEvent event, Emitter emitter) async {
    emitter(state.copyWith(
        resourceList: event.resource.list, next: event.resource.next, previous: event.resource.previous));
  }

  Future<void> _onLoadNextData(ResourceLoadNextDataEvent event, Emitter emitter) async {
    add(ResourceLoadingEvent());
    var resource = await event.nextFuture;
    var list = state.resourceList ?? [];
    list.addAll(resource.list);
    emitter(state.copyWith(resourceList: list, next: resource.next, previous: resource.previous, isLoadingData: false));
  }

  void _onLoading(ResourceLoadingEvent _, Emitter emitter) async {
    emitter(state.copyWith(isLoadingData: true, next: state.next, previous: state.previous));
  }
}
