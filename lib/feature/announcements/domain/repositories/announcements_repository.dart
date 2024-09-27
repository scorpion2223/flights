import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/announcements/domain/entities/announcements_entity.dart';

import '../../../../core/params/announcements_param.dart';

abstract class AnnouncementsRepository{
  Future<Either<Failure,AnnouncementsEntity>> getAnnouncements();
  Future<Either<Failure,Unit>> AnnouncementTrip(AnnouncementsParam param);

}

