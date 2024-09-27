import 'package:dartz/dartz.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/repositories/cancellation_reasons_repository.dart';

import '../../../../../errors/failures.dart';
import '../entities/cancellation_reasons_entity.dart';

class GetCancellationReasonsUseCase{
  final CancellationReasonsRepository cancellationReasonsRepository;

  GetCancellationReasonsUseCase({required this.cancellationReasonsRepository});

  Future<Either<Failure,CancellationReasonsEntity>> call() async =>await cancellationReasonsRepository.getData();




}