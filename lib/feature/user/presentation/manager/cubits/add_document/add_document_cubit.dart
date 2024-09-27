import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/params/document_param.dart';
import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/add_documents_use_case.dart';

part 'add_document_state.dart';

class AddDocumentCubit extends Cubit<AddDocumentState> {
  final AddDocumentsUseCase useCase;
   DocumentParam param = DocumentParam.newParam();
  SwitchFialure switchFialure = SwitchFialure();
  AddDocumentCubit({required this.useCase}) : super(AddDocumentInitial());
  Future<void> addDocument()async{
    emit(AddDocumentLoading());
    final response = await useCase.call(param);
    response.fold((failure){
      emit(AddDocumentFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(AddDocumentSuccess(message: ""));
    });

  }
}