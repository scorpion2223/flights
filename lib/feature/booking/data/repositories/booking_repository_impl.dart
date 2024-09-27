import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/booking_param.dart';
import 'package:flightes/core/params/cancellation_booking_param.dart';
import 'package:flightes/feature/booking/data/data_source/remote/booking_remote_data_source.dart';
import 'package:flightes/feature/booking/domain/entities/booking_entity.dart';
import 'package:flightes/feature/booking/domain/entities/one_flight_offer_entity.dart';
import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';

import '../../../../core/params/custom_booking_param.dart';

class BookingRepositoryImpl implements BookingRepository{
  final BookingRemoteDataSource dataSource;

  BookingRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, Unit>> cancelBooking(CancellationBookingParam param) async{
    // TODO: implement cancelBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookingEntity>> getAllBookingForUser(int userId) async{
    // TODO: implement getAllBookingForUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OneFlightOfferEntity>> getFlightOfferById(int offerId)async {
    // TODO: implement getFlightOfferById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> modifyBooking(BookingParam param, int bookingId) async{
    // TODO: implement modifyBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> storeBooking(CustomBookingParam param) async{
    try{
      final response = await dataSource.storeBooking(param);
      return Right(unit);
    }on ServerException{
      return Left(ServerFailure());
    }on UnExpictedException{
      return Left(UnExpFailure());
    }
  }

}