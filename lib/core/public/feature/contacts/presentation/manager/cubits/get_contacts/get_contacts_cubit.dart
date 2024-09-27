import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../../utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_contacts_use_case.dart';

part 'get_contacts_state.dart';

class GetContactsCubit extends Cubit<GetContactsState> {
  final GetContactsUseCase useCase;
  SwitchFialure switchFialure = SwitchFialure();

  GetContactsCubit({required this.useCase}) : super(GetContactsInitial());

  Future<void> getContacts()async{
    emit(GetContactsLoading());
    final response = await useCase.call();

    response.fold(
            (failure){
          emit(GetContactsFailed(message: switchFialure.mapErrorMessage(failure)));

        },

            (success){
          log(success.contacts.toString());
          if(success.contacts!.isNotEmpty ){

            emit(GetContactsSuccess(entity: success));}
          else{
            emit(GetContactsEmpty(message: "empty list"));
          }

        });
  }
}
