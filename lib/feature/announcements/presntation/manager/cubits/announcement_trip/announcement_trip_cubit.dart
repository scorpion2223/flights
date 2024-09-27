import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/announcements_param.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/announcement_trip_use_case.dart';

part 'announcement_trip_state.dart';

class AnnouncementTripCubit extends Cubit<AnnouncementTripState> {
  final AnnouncementTripUseCase useCase;
  AnnouncementsParam param = AnnouncementsParam.newParam();
  SwitchFialure switchFialure = SwitchFialure();

  AnnouncementTripCubit({required this.useCase}) : super(AnnouncementTripInitial());

  Future<void> announcementsTrip()async{
    emit(AnnouncementTripLoading());
    final response = await useCase.call(param);

    response.fold((failure){
      emit(AnnouncementTripFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(AnnouncementTripSuccess(message: ""));
    });
  }
}
