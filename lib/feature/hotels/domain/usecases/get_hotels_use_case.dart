import 'package:dartz/dartz.dart';
import 'package:flightes/feature/hotels/domain/repositories/hotels_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/hotels_param.dart';
import '../entities/hotels_entity.dart';

class GetHotelsUseCase{
  final HotelsRepository hotelsRepository;

  GetHotelsUseCase({required this.hotelsRepository});
  Future<Either<Failure,HotelsEntity>> call(HotelsParam param)async =>await hotelsRepository.getHotels(param);

}