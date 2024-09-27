import 'package:bloc/bloc.dart';
import 'package:flightes/core/utils/switches/switch_fialure.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/params/document_param.dart';
import '../../../../domain/usecases/modify_documents_use_case.dart';

part 'modify_document_state.dart';

class ModifyDocumentCubit extends Cubit<ModifyDocumentState> {
  final ModifyDocumentsUseCase useCase;
  late DocumentParam param;
  SwitchFialure switchFialure = SwitchFialure();
  ModifyDocumentCubit({required this.useCase}) : super(ModifyDocumentInitial());
  Future<void> modifyDocument(int documentId)async{
    emit(ModifyDocumentLoading());
    final response = await useCase.call(param, documentId);
    response.fold((failure){
      emit(ModifyDocumentFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(ModifyDocumentSuccess(message: ""));
    });

  }
}
