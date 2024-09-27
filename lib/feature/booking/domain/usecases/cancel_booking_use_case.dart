import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';

class CancelBookingUseCase{
  final BookingRepository bookingRepository;

  CancelBookingUseCase({required this.bookingRepository});
}