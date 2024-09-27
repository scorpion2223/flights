import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/delete_document_use_case.dart';

part 'delete_document_state.dart';

class DeleteDocumentCubit extends Cubit<DeleteDocumentState> {
  final DeleteDocumentUseCase useCase;

  SwitchFialure switchFialure = SwitchFialure();
  DeleteDocumentCubit({required this.useCase}) : super(DeleteDocumentInitial());
  Future<void> deleteDocument(int documentId)async{
    emit(DeleteDocumentLoading());
    final response = await useCase.call(documentId);
    response.fold((failure){
      emit(DeleteDocumentFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(DeleteDocumentSuccess(message: ""));
    });

  }
}