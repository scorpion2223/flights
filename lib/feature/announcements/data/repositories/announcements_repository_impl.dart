import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/announcements_param.dart';
import 'package:flightes/feature/announcements/data/data_sources/remote/announcements_remote_data_source.dart';
import 'package:flightes/feature/announcements/domain/entities/announcements_entity.dart';
import 'package:flightes/feature/announcements/domain/repositories/announcements_repository.dart';

class AnnouncementsRepositoryImpl implements AnnouncementsRepository{
  final AnnouncementsRemoteDataSource remoteDataSource;

  AnnouncementsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> AnnouncementTrip(AnnouncementsParam param) async{
   try{
     final response = await remoteDataSource.AnnouncementTrip(param);
     return Right(unit);

   }on ServerException{
     return Left(ServerFailure());
   }
  }

  @override
  Future<Either<Failure, AnnouncementsEntity>> getAnnouncements()async {
    try{
      final response = await remoteDataSource.getAnnouncements();
      return Right(response);

    }on ServerException{
      return Left(ServerFailure());
    }
  }

}