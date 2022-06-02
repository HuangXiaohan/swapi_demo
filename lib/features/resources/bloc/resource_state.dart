part of 'resource_bloc.dart';

class ResourceState {
  Future initFuture;
  List? resourceList;
  String? next;
  String? previous;
  bool isLoadingData;

  ResourceState({required this.initFuture, this.resourceList, this.next, this.previous, this.isLoadingData = false});

  ResourceState copyWith(
      {Future? initFuture, List? resourceList, String? next, String? previous, bool? isLoadingData}) {
    return ResourceState(
        initFuture: initFuture ?? this.initFuture,
        resourceList: resourceList ?? this.resourceList,
        next: next,
        previous: previous,
        isLoadingData: isLoadingData ?? this.isLoadingData);
  }
}
