import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_random_advice.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class RandomAdviceBloc extends Bloc<RandomAdviceEvent, RandomAdviceState> {
  final GetRandomAdvice _getRandomAdvice;

  RandomAdviceBloc(this._getRandomAdvice) : super(RandomAdviceIsEmpty()) {
    on<FetchRandomAdvice>(
      (event, emit) async {
        if (state is RandomAdviceIsEmpty) {
          final result = await _getRandomAdvice.get();
          result.fold(
            (failure) {
              emit(RandomAdviceIsError(failure.message));
            },
            (data) {
              emit(RandomAdviceHasData(advice: data));
            },
          );
        } else {}
      },
    );

    on<PullToRefreshEvent>(
      (event, emit) async {
        final result = await _getRandomAdvice.get();
        result.fold(
          (failure) {
            emit(RandomAdviceIsError(failure.message));
          },
          (data) {
            emit(RandomAdviceHasData(advice: data));
          },
        );
      },
    );
  }
}
