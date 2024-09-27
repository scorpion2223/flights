
import 'package:dio/dio.dart';
import 'package:flightes/core/params/address_param.dart';
import 'package:flightes/core/public/feature/cities/domain/entities/cities_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/public/feature/cities/data/data_sources/remote/cities_remote_data_source.dart';
import '../../../../../core/public/feature/cities/data/repositories/cities_repository_impl.dart';
import '../../../../../core/public/feature/cities/domain/usecases/get_cities_use_case.dart';
import '../../../../../core/public/feature/cities/presentation/manager/cubits/get_cities/get_cities_cubit.dart';
import 'address_city_choose.dart';

class AddressCityForm extends StatefulWidget {
  final AddressParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<OneCity> onChanged;

  const AddressCityForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _AddressCityForm();
  }
}

class _AddressCityForm extends State<AddressCityForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetCitiesCubit(
            useCase: GetCitiesUseCase(
                citiesRepository:CitiesRepositoryImpl(
                   citiesRemoteDataSource:
                    CitiesRemoteDataSourceWithDio(dio: Dio()))))
          ..getCities();
      },
      child: BlocConsumer<GetCitiesCubit, GetCitiesState>(
        listener: (context, state) {
          if (state is GetCitiesSuccess) {
            if(state.entity.cities!.isNotEmpty){
              widget.param.cityId = state.entity.cities!.first.id;}

          }
        },
        builder: (context, state) {
          if (state is GetCitiesLoading) {
            return CircularProgressIndicator();
          }
          // if (state is GetCitiesEmpty) {
          //   return Center(child: Text(state.message),);
          // }
          if (state is GetCitiesSuccess) {
            return AddressCityChoose(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "cities",
                    items: state.entity.cities!,
                  );
                },
                name: "${context.read<GetCitiesCubit>().name}");
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<OneCity> items,

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
                  ctx.read<GetCitiesCubit>().name = items[index].name!;

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
