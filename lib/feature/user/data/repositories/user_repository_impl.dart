import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/address_param.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/data/data_source/remote/user_remote_data_source.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/domain/entities/points_entity.dart';
import 'package:flightes/feature/user/domain/entities/user_details_entity.dart';
import 'package:flightes/feature/user/domain/entities/user_documents_entity.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> addAddress(ContactParam param)async {
    try{
      final response = await userRemoteDataSource.addAddress(param);
      return Right(unit);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addDocument(DocumentParam param) async{
    try{
      final response = await userRemoteDataSource.addDocument(param);
      return Right(unit);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDocument(int documentId) async{
    try{
      final response = await userRemoteDataSource.deleteDocument( documentId);
      return Right(unit);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DocumentsTypeEntity>> getDocumentsType() async{
    try{
      final response = await userRemoteDataSource.getDocumentsType();
      return Right(response);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PointsEntity>> getPoints(int id) async{
    try{
      final response = await userRemoteDataSource.getPoints(id);
      return Right(response);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserDetailsEntity>> getUserDetails(int userId)async {
    try{
      final response = await userRemoteDataSource.getUserDetails(userId);
      return Right(response);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserDocumentsEntity>> getUserDocuments(int userId) async{
    try{
      final response = await userRemoteDataSource.getUserDocuments(userId);
      return Right(response);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> modifyDocument(DocumentParam param, int documentId)async {
    try{
      final response = await userRemoteDataSource.modifyDocument(param, documentId);
      return Right(unit);

    } on ServerException{
      return Left(ServerFailure());
    }
  }


}