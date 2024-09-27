import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/domain/entities/points_entity.dart';
import 'package:flightes/feature/user/domain/entities/user_details_entity.dart';
import 'package:flightes/feature/user/domain/entities/user_documents_entity.dart';

import '../../../../core/params/address_param.dart';

abstract class UserRepository{
  Future<Either<Failure,PointsEntity>>getPoints(int id);
  Future<Either<Failure,Unit>> addAddress(ContactParam param);
  Future<Either<Failure,DocumentsTypeEntity>> getDocumentsType();
  Future<Either<Failure,UserDetailsEntity>> getUserDetails(int userId);
  Future<Either<Failure,UserDocumentsEntity>> getUserDocuments(int userId);
  Future<Either<Failure,Unit>> deleteDocument(int documentId);
  Future<Either<Failure,Unit>> addDocument(DocumentParam param);
  Future<Either<Failure,Unit>> modifyDocument(DocumentParam param,int documentId);



}