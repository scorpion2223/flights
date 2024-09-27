import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/entities/cancellation_reasons_entity.dart';
import 'package:flightes/core/utils/switches/switch_fialure.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/get_cancellation_reasons_use_case.dart';

part 'get_cancellation_reasons_state.dart';

class GetCancellationReasonsCubit extends Cubit<GetCancellationReasonsState> {
  final GetCancellationReasonsUseCase getCancellationReasonsUseCase;
  late String reason;
  GetCancellationReasonsCubit({required this.getCancellationReasonsUseCase}) : super(GetCancellationReasonsInitial());

  Future<void> getData()async{
    emit(GetCancellationReasonsLoading());
    final response  = await getCancellationReasonsUseCase.call();
    response.fold((failure){
      emit(GetCancellationReasonsFailed(message: SwitchFialure().mapErrorMessage(failure)));

    }, (success){
      if(success.data!.isEmpty){
        emit(GetCancellationReasonsEmpty(message: "empty data"));
      }else{
        emit(GetCancellationReasonsSuccess(entity: success));
      }

    });
  }
}
