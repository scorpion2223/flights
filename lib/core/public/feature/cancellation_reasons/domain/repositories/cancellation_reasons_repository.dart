import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/entities/cancellation_reasons_entity.dart';

abstract class CancellationReasonsRepository{
  Future<Either<Failure,CancellationReasonsEntity>> getData();


}