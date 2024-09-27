import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/contacts/data/data_sources/remote/contacts_remote_data_source.dart';
import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';
import 'package:flightes/core/public/feature/contacts/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository{
  final ContactsRemoteDataSource dataSource;

  ContactsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, ContactsEntity>> getContacts()async {
    try{
      final response = await dataSource.getContacts();
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}