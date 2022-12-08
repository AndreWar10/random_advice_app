import 'package:equatable/equatable.dart';

import '../../domain/entitites/random_advice_entitie.dart';



abstract class RandomAdviceState extends Equatable {
  const RandomAdviceState();

  @override
  List<Object?> get props => [];
}

class RandomAdviceIsEmpty extends RandomAdviceState {}

class RandomAdviceIsLoading extends RandomAdviceState {}

class RandomAdviceIsError extends RandomAdviceState {
  final String message;
  const RandomAdviceIsError(this.message);

  @override
  List<Object?> get props => [message];
}

class RandomAdviceHasData extends RandomAdviceState {
  final RandomAdviceEntitie advice;

  const RandomAdviceHasData({
     required this.advice }
  );

   RandomAdviceHasData copyWith({
    RandomAdviceEntitie? advice,
  }) {
    
    return RandomAdviceHasData(
      advice: advice ?? this.advice,
    );
  }

  @override
  List<Object?> get props => [advice];
}
