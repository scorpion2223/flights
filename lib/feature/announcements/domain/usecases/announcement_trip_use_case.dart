import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/announcements_param.dart';
import 'package:flightes/feature/announcements/domain/repositories/announcements_repository.dart';

class AnnouncementTripUseCase{
  final AnnouncementsRepository repository;

  AnnouncementTripUseCase({required this.repository});
  Future<Either<Failure,Unit>> call(AnnouncementsParam param)async =>await repository.AnnouncementTrip(param);
}