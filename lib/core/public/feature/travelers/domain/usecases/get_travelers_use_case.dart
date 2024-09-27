import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/travelers/domain/entities/travelers_entity.dart';
import 'package:flightes/core/public/feature/travelers/domain/repositories/travelers_repository.dart';

class GetTravelersUseCase{
  final TravelersRepository repository;

  GetTravelersUseCase({required this.repository});

  Future<Either<Failure,TravelersEntity>> call()async=>await repository.getTravelers();
}