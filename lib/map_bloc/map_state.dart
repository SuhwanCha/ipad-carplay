part of 'map_bloc.dart';

@immutable
class MapState extends Equatable {
  const MapState({
    this.remainDistance = 0,
    this.remainTime = 0,
  });

  final int remainDistance;
  final int remainTime;

  MapState copyWith({
    int? remainDistance,
    int? remainTime,
  }) {
    return MapState(
      remainDistance: remainDistance ?? this.remainDistance,
      remainTime: remainTime ?? this.remainTime,
    );
  }

  @override
  List<Object> get props => [remainDistance, remainTime];
}
