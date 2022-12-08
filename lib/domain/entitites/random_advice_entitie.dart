import '../../data/models/random_advice_model.dart';

class RandomAdviceEntitie {
  RandomAdviceEntitie({
    required this.slip,
  });

  final Slip slip;

  List<Object?> get props => [slip];
}
