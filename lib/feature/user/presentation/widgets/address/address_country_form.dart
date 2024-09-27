
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/public/feature/countries/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/address_param.dart';
import '../../../../../core/public/feature/countries/data/data_sources/remote/country_remote_data_source.dart';
import '../../../../../core/public/feature/countries/data/repositories/country_repository_impl.dart';
import '../../../../../core/public/feature/countries/domain/usecases/get_contries_use_case.dart';
import '../../../../../core/public/feature/countries/presentation/manager/cubits/get_countries/get_countries_cubit.dart';
import 'address_country_choose.dart';

class AddressCountryForm extends StatefulWidget {
  final AddressParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<OneCountry> onChanged;

  const AddressCountryForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _AddressCountryForm();
  }
}

class _AddressCountryForm extends State<AddressCountryForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetCountriesCubit(
            useCase: GetCountriesUseCase(
                countryRepository:CountryRepositoryImpl(
                    countryRemoteDataSource:
                    CountryRemoteDataSourceWithDio(dio: Dio()))))
          ..getCountries();
      },
      child: BlocConsumer<GetCountriesCubit, GetCountriesState>(
        listener: (context, state) {
          if (state is GetCountriesSuccess) {
            if(state.entity.countries!.isNotEmpty){
              log("countries not empty");
              widget.param.countryId = state.entity.countries!.first.id;
            }

          }
        },
        builder: (context, state) {
          if (state is GetCountriesLoading) {
            return CircularProgressIndicator();
          }
          // if (state is GetCountriesEmpty) {
          //   return Center(child: Text(state.message),);
          // }
          if (state is GetCountriesSuccess) {
            return AddressCountryChoose(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "countries",
                    items: state.entity.countries!,
                  );
                },
                name: "${context.read<GetCountriesCubit>().name}");
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<OneCountry> items,

      }) {
    final alert = AlertDialog(
        title: Center(child: Text(alertDialogTitle)),
        alignment: Alignment.center,
        content: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            width: widget.listWidth / 4,
            height: widget.listHeight * 0.5,
            child: ListView.builder(
              itemBuilder: (context, index) => TextButton(
                onPressed: () async {
                  ctx.read<GetCountriesCubit>().name = items[index].name!;

                  widget.onChanged(items[index]);
                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text("${index} : ${items[index].name!}"),
              ),
              itemCount: items.length,
            )));

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
