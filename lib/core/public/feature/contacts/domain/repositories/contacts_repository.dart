import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';

abstract class ContactsRepository{

  Future<Either<Failure,ContactsEntity>> getContacts();
}