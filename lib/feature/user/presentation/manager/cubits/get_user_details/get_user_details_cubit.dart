import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/entities/user_details_entity.dart';
import '../../../../domain/usecases/get_user_details_use_case.dart';

part 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  final GetUserDetailsUseCase useCase;

  SwitchFialure switchFialure = SwitchFialure();
  GetUserDetailsCubit({required this.useCase}) : super(GetUserDetailsInitial());
  Future<void> getUserDetails(int userId)async{
    emit(GetUserDetailsLoading());
    final response = await useCase.call(userId);
    response.fold((failure){
      emit(GetUserDetailsFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(GetUserDetailsSuccess(entity: success));
    });

  }
}