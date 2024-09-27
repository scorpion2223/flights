import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/feature/flights/domain/entities/flights.dart';
import 'package:flightes/feature/flights/domain/entities/flights_offers_with_pricing_entity.dart';
import 'package:flightes/feature/flights/domain/usecases/get_flights_offer_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/switches/switch_fialure.dart';

part 'get_flights_offer_state.dart';

class GetFlightsOfferCubit extends Cubit<GetFlightsOfferState> {
  final GetFlightsOfferUseCase getFlightsOfferUseCase;
  final SearchParam param;
  final SwitchFialure switchFailure = SwitchFialure();
  GetFlightsOfferCubit({required this.getFlightsOfferUseCase,required this.param}) : super(GetFlightsOfferInitial());

  Future<void> getOffers()async{
    emit(GetFlightsOfferLoading());
    final response = await getFlightsOfferUseCase.call(param);
    response.fold(

            (failure){
              emit(GetFlightsOfferFailed(message: switchFailure.mapErrorMessage(failure)));
            },
            (success){
              if(success.data!.original!.errors ==null&&success.data!.original!.error==null){
                log(success.data!.original!.errors.toString());
                if(success.data!.original!.data!.flightOffers!.isNotEmpty){
                  log("success");
                  emit(GetFlightsOfferSuccess(entity: success));
                }else{
                  log("empty");
                  emit(GetFlightsOfferEmpty(message: "no flights offer founded !"));
                }


              }else{
                log("external");
                emit(GetFlightsOfferFailedExternalServer(message:"external server error" ));
              }

    });

  }
}
