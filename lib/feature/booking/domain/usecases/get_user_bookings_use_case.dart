import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';

class GetUserBookingsUseCase{
  final BookingRepository bookingRepository;

  GetUserBookingsUseCase({required this.bookingRepository});
}