import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_documents_type_use_case.dart';

part 'get_documents_type_state.dart';

class GetDocumentsTypeCubit extends Cubit<GetDocumentsTypeState> {
  final GetDocumentsTypeUseCase useCase;
   String? name;

  SwitchFialure switchFialure = SwitchFialure();
  GetDocumentsTypeCubit({required this.useCase}) : super(GetDocumentsTypeInitial());
  Future<void> getDocumentsType()async{
    emit(GetDocumentsTypeLoading());
    final response = await useCase.call();
    response.fold((failure){
      emit(GetDocumentsTypeFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){

      name =success.documents!.first.name;
      emit(GetDocumentsTypeSuccess(entity: success));
    });

  }
}