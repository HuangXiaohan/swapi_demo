part of 'resource_bloc.dart';

abstract class ResourceEvent {}

class ResourceReceiveDataEvent extends ResourceEvent {
  final Resource resource;
  ResourceReceiveDataEvent(this.resource);
}

class ResourceLoadNextDataEvent extends ResourceEvent {
  final Future nextFuture;
  ResourceLoadNextDataEvent(this.nextFuture);
}

class ResourceLoadingEvent extends ResourceEvent {}
