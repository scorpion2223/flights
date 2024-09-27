import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';
import 'package:flightes/core/public/feature/contacts/domain/repositories/contacts_repository.dart';

class GetContactsUseCase{
  final ContactsRepository repository;

  GetContactsUseCase({required this.repository});
  Future<Either<Failure,ContactsEntity>> call()async =>await repository.getContacts();
}