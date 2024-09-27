import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/user/domain/entities/points_entity.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class GetPointsUseCase{
  final UserRepository userRepository;

  GetPointsUseCase({required this.userRepository});
  Future<Either<Failure,PointsEntity>> call(int id) async => await userRepository.getPoints(id);

}