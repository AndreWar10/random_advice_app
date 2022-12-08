import 'package:either_dart/either.dart';
import '../../utils/failure.dart';
import '../entitites/random_advice_entitie.dart';
import '../repositories/random_advice_repository.dart';

class GetRandomAdvice {
  final RandomAdviceRepository repository;
  GetRandomAdvice(this.repository);

  Future<Either<Failure, RandomAdviceEntitie>> get() {
    // ignore: avoid_print
    print('getting Advice API..');
    return repository.getAdvice();
  }

}