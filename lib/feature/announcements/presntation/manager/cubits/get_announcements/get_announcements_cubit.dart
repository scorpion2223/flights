import 'package:bloc/bloc.dart';
import 'package:flightes/feature/announcements/domain/entities/announcements_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_announcements_use_case.dart';

part 'get_announcements_state.dart';

class GetAnnouncementsCubit extends Cubit<GetAnnouncementsState> {
  final GetAnnouncementsUseCase useCase;
  SwitchFialure switchFialure = SwitchFialure();
  String?name;

  GetAnnouncementsCubit({required this.useCase}) : super(GetAnnouncementsInitial());

  Future<void> getAnnouncements()async{
    emit(GetAnnouncementsLoading());
    final response = await useCase.call();

    response.fold((failure){
      emit(GetAnnouncementsFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      name = success.data!.announcements!.first.name;
      emit(GetAnnouncementsSuccess(entity:success));
    });
  }
}
