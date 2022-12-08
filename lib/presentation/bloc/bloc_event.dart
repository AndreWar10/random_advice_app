import 'package:equatable/equatable.dart';

abstract class RandomAdviceEvent extends Equatable {
  const RandomAdviceEvent();

  @override
  List<Object?> get props => [];
}

class FetchRandomAdvice extends RandomAdviceEvent {

} 
class RefreshedRandomAdvice extends RandomAdviceEvent {
} 

class PullToRefreshEvent extends RandomAdviceEvent {}