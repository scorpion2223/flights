import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';

import '../../../../core/params/custom_booking_param.dart';

class StoreBookingUseCase {
  final BookingRepository bookingRepository;

  StoreBookingUseCase({required this.bookingRepository});

  Future<Either<Failure,Unit>> call(CustomBookingParam param)async=> await bookingRepository.storeBooking(param);

}