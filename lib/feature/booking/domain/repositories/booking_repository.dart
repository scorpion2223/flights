import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/booking_param.dart';
import 'package:flightes/core/params/cancellation_booking_param.dart';
import 'package:flightes/feature/booking/domain/entities/booking_entity.dart';
import 'package:flightes/feature/booking/domain/entities/one_flight_offer_entity.dart';

import '../../../../core/params/custom_booking_param.dart';

abstract class BookingRepository {
  Future<Either<Failure,Unit>> storeBooking(CustomBookingParam param);
  Future<Either<Failure,Unit>> cancelBooking(CancellationBookingParam param);
  Future<Either<Failure,BookingEntity>> getAllBookingForUser(int userId);
  Future<Either<Failure,OneFlightOfferEntity>> getFlightOfferById(int offerId);
  Future<Either<Failure,Unit>> modifyBooking(BookingParam param , int bookingId);




}