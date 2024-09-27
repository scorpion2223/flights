import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/hotels_param.dart';
import 'package:flightes/feature/hotels/domain/entities/hotels_entity.dart';

abstract class HotelsRepository{
  Future<Either<Failure,HotelsEntity>> getHotels(HotelsParam param);

}