import 'package:bloc/bloc.dart';
import 'package:flightes/feature/user/domain/entities/points_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_points_use_case.dart';

part 'get_points_state.dart';

class GetPointsCubit extends Cubit<GetPointsState> {
  final GetPointsUseCase useCase;

  SwitchFialure switchFialure = SwitchFialure();
  GetPointsCubit({required this.useCase}) : super(GetPointsInitial());
  Future<void> getPoints(int userId)async{
    emit(GetPointsLoading());
    final response = await useCase.call(userId);
    response.fold((failure){
      emit(GetPointsFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(GetPointsSuccess(entity: success));
    });

  }
}