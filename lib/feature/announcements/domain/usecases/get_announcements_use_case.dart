import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/announcements/domain/entities/announcements_entity.dart';
import 'package:flightes/feature/announcements/domain/repositories/announcements_repository.dart';

class GetAnnouncementsUseCase{
  final AnnouncementsRepository repository;

  GetAnnouncementsUseCase({required this.repository});
  Future<Either<Failure,AnnouncementsEntity>> call()async =>await repository.getAnnouncements();
}