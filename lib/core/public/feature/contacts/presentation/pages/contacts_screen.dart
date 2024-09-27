import 'package:dio/dio.dart';
import 'package:flightes/core/params/custom_booking_param.dart';
import 'package:flightes/core/params/remarks_param.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/params/ticketing_agreement_param.dart';
import 'package:flightes/core/public/feature/contacts/presentation/widgets/contact_component.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/booking/data/data_source/remote/booking_remote_data_source.dart';
import 'package:flightes/feature/booking/data/repositories/booking_repository_impl.dart';
import 'package:flightes/feature/booking/domain/repositories/booking_repository.dart';
import 'package:flightes/feature/booking/domain/usecases/store_booking_use_case.dart';
import 'package:flightes/feature/booking/presentation/manager/cubits/store_booking/store_booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../travelers/domain/entities/travelers_entity.dart';
import '../../data/data_sources/remote/contacts_remote_data_source.dart';
import '../../data/repositories/contacts_repository_impl.dart';
import '../../domain/entities/contacts_entity.dart';
import '../../domain/usecases/get_contacts_use_case.dart';
import '../manager/cubits/get_contacts/get_contacts_cubit.dart';

class ContactsScreen extends StatelessWidget {
  final SearchParam param;
  final TravelersEntity entity;

  const ContactsScreen({super.key, required this.param, required this.entity});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: BlocProvider(
        create: (context) {
          return GetContactsCubit(
            useCase: GetContactsUseCase(
                repository: ContactsRepositoryImpl(
                    dataSource: ContactsRemoteDataSourceWithDio(dio: Dio()))),
          )..getContacts();
        },
        child: BlocConsumer<GetContactsCubit, GetContactsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetContactsSuccess) {
              return Center(
                  child: Column(
                children: [
                  Container(
                    width: width / 1.2,
                    height: height / 1.5,
                    child: listContacts(
                        state.entity.contacts!, width / 1.2, height / 5),
                  ),
                  SizedBox(
                    height: height/50,
                      child:Center()),
                  BlocProvider(
                    create: (context) {
                      return StoreBookingCubit(
                          useCase: StoreBookingUseCase(
                              bookingRepository: BookingRepositoryImpl(
                                  dataSource: BookingRemoteDataSourceWithDio(
                                      dio: Dio()))),
                          param: CustomBookingParam(
                              paramSearch: param,
                              paramRemarks: RemarksParam(),
                              paramTicketingAgreementParam:
                              TicketingAgreementParam(),
                              entityTravelers: entity,
                              entityContacts: state.entity));
                    },
                    child: BlocConsumer<StoreBookingCubit, StoreBookingState>(
                      listener: (context, state) {
                        if(state is StoreBookingSuccess){
                          ScaffoldMessageUtil().customScaffoldMessenger(context, "booking success", Colors.green);
                        }
                        if(state is StoreBookingFailed){
                          ScaffoldMessageUtil().customScaffoldMessenger(context, "booking Failed!", Colors.red);
                        }
                      },
                      builder: (context, state) {
                        return TextButton(
                          style: TextButton.styleFrom(backgroundColor: AppColors.blue2),
                          onPressed: () {
                            context.read<StoreBookingCubit>().storeBooking();
                          },
                          child: (state is StoreBookingLoading)
                              ? CircularProgressIndicator(
                            color: AppColors.white,
                          )
                              : Text("Booking",style: TextStyle(color: Colors.white),),
                        );
                      },
                    ),
                  )
                ],
              ));
            }
            if (state is GetContactsEmpty) {
              return Center(
                  child: Text(
                state.message,
                style: const TextStyle(fontSize: 30, color: Colors.red),
              ));
            }
            if (state is GetContactsFailed) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 30, color: Colors.green),
                ),
              );
            }
            if (state is GetContactsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }

  Widget listContacts(List<Contact> list, double width, double height) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ContactComponent(
                contact: list[index], width: width, height: height)));
  }
}
