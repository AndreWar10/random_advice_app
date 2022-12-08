import 'dart:io';
import 'package:either_dart/either.dart';
import '../../domain/entitites/random_advice_entitie.dart';
import '../../domain/repositories/random_advice_repository.dart';
import '../../utils/failure.dart';
import '../../utils/server_exception.dart';
import '../datasources/random_advice_remote_datasource.dart';

class RandomAdviceRepositoryImpl implements RandomAdviceRepository {
  final RandomAdviceRemoteDataSource adviceRemoteDataSource;

  RandomAdviceRepositoryImpl({required this.adviceRemoteDataSource});

  @override
  Future<Either<Failure, RandomAdviceEntitie>> getAdvice() async {
    try {
      final result = await adviceRemoteDataSource.getAdvice();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }
}
