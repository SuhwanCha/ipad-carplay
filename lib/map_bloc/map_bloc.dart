import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapUpdated>(_onMapUpdated);
  }

  FutureOr<void> _onMapUpdated(MapUpdated event, Emitter<MapState> emit) {
    emit(
      state.copyWith(
        remainDistance: event.remainDistance,
        remainTime: event.remainTime,
      ),
    );
  }
}
