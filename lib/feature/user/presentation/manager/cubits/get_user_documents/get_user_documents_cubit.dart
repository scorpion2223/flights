import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/entities/user_documents_entity.dart';
import '../../../../domain/usecases/get_user_documents_use_case.dart';

part 'get_user_documents_state.dart';

class GetUserDocumentsCubit extends Cubit<GetUserDocumentsState> {
  final GetUserDocumentsUseCase useCase;

  SwitchFialure switchFialure = SwitchFialure();
  GetUserDocumentsCubit({required this.useCase}) : super(GetUserDocumentsInitial());
  Future<void> getUserDocuments(int userId)async{
    emit(GetUserDocumentsLoading());
    final response = await useCase.call(userId);
    response.fold((failure){
      emit(GetUserDocumentsFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(GetUserDocumentsSuccess(entity: success));
    });

  }
}