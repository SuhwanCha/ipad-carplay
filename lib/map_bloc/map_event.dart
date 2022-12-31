part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapUpdated extends MapEvent {
  MapUpdated({
    this.remainDistance = 0,
    this.remainTime = 0,
  });

  final int remainDistance;
  final int remainTime;
}
