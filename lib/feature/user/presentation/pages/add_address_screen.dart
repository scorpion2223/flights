import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/user/data/data_source/remote/user_remote_data_source.dart';
import 'package:flightes/feature/user/data/repositories/user_repository_impl.dart';
import 'package:flightes/feature/user/domain/usecases/add_address_use_case.dart';
import 'package:flightes/feature/user/presentation/manager/cubits/add_address/add_address_cubit.dart';
import 'package:flightes/feature/user/presentation/widgets/address/address_country_form.dart';
import 'package:flightes/feature/user/presentation/widgets/address/address_form.dart';
import 'package:flightes/feature/user/presentation/widgets/address/country_address_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/address/address_city_form.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddAddressScreen();
  }
}

class _AddAddressScreen extends State<AddAddressScreen> {
  final formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => AddAddressCubit(
              useCase: AddAddressUseCase(
                  userRepository: UserRepositoryImpl(
                      userRemoteDataSource:
                          UserRemoteDataSourceWithDio(dio: Dio())))),
          child: BlocConsumer<AddAddressCubit, AddAddressState>(
            listener: (context, state) {
              if(state is AddAddressFailed){
                ScaffoldMessageUtil().customScaffoldMessenger(context, "add address field ! ", Colors.red);
              }
              if(state is AddAddressSuccess){
                ScaffoldMessageUtil().customScaffoldMessenger(context, "add address success ! ", Colors.green);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CountryAddressForm(
                      height: height,
                      listWidth: width,
                      listHeight: height,
                      onDocumentChanged: (value){
                        context.read<AddAddressCubit>().param.addressCountryCode = value.name;
                        context.read<AddAddressCubit>().param.addressCityName = value.cities.first.name;
                        context.read<AddAddressCubit>().param.addressPostalCode = value.cities.first.postalCode;
                        setState(() {
                          log("${ context.read<AddAddressCubit>().param.addressCountryCode}\n"
                              "${ context.read<AddAddressCubit>().param.addressCityName}\n"
                              "${ context.read<AddAddressCubit>().param.addressPostalCode}\n");

                        });

                        log(value.name);
                      },

                      onChangedCity: (value){
                        context.read<AddAddressCubit>().param.addressCityName = value.name;
                        context.read<AddAddressCubit>().param.addressPostalCode = value.postalCode;
                        setState(() {
                          log("${ context.read<AddAddressCubit>().param.addressCountryCode}\n"
                              "${ context.read<AddAddressCubit>().param.addressCityName}\n"
                              "${ context.read<AddAddressCubit>().param.addressPostalCode}\n");

                        });
                        log(value.name);
                        log(value.postalCode);

                      }),
                  AddressForm(
                    formState: formState,
                    param: context.read<AddAddressCubit>().param,
                    onChanged: (value) {
                      context.read<AddAddressCubit>().param = value;
                      setState(() {
                        log(context
                            .read<AddAddressCubit>()
                            .param
                            .emailAddress
                            .toString());
                      });
                    },
                    width: width,
                    height: height/40, onChangedPhone: ( value) {
                    context.read<AddAddressCubit>().param.phones = value;
                    setState(() {
                      log(context
                          .read<AddAddressCubit>()
                          .param
                          .phones
                          .number
                          .toString());
                    });
                  },
                  ),
                  TextButton(
                    onPressed: () {
                      // log("${context.read<AddAddressCubit>().param.cityId}\n"
                      //     "${context.read<AddAddressCubit>().param.countryId}\n"
                      //     "${context.read<AddAddressCubit>().param.street}\n"
                      //     "${context.read<AddAddressCubit>().param.area}\n"
                      //     "${context.read<AddAddressCubit>().param.landmark}\n"
                      //     "${context.read<AddAddressCubit>().param.building}\n"
                      //     "${context.read<AddAddressCubit>().param.userId}\n");
                      bool isValid = formState.currentState!.validate();
                      if (isValid) {
                        context.read<AddAddressCubit>().addAddress();
                      }
                    },
                    style: TextButton.styleFrom(backgroundColor: AppColors.blue2),
                    child: (state is AddAddressLoading)
                        ? const CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : const Text("add",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//      Text(
//       "Country ",
//       style: TextStyle(color: AppColors.orange1),
//     ),
//     AddressCountryForm(
//         height: height,
//         listWidth: width,
//         listHeight: height,
//         onChanged: (value) {
//           context.read<AddAddressCubit>().param.countryId =
//               value.id;
//           setState(() {});
//         },
//         param: context.read<AddAddressCubit>().param),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//      Text(
//       "City ",
//       style: TextStyle(color: AppColors.orange1),
//     ),
//     AddressCityForm(
//         height: height,
//         listWidth: width,
//         listHeight: height,
//         onChanged: (value) {
//           context.read<AddAddressCubit>().param.cityId =
//               value.id;
//           setState(() {});
//         },
//         param: context.read<AddAddressCubit>().param),
//   ],
// ),
