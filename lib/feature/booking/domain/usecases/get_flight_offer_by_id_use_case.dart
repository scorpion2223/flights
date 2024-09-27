import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';

class GetFlightOfferByIdUseCase{
  final BookingRepository bookingRepository;

  GetFlightOfferByIdUseCase({required this.bookingRepository});
}