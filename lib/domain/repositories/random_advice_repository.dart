import 'package:either_dart/either.dart';
import '../../utils/failure.dart';
import '../entitites/random_advice_entitie.dart';

abstract class RandomAdviceRepository {
  Future<Either<Failure, RandomAdviceEntitie>> getAdvice();
}
