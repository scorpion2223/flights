
import 'package:dio/dio.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';
import 'package:flightes/feature/air_porst/presentation/widgets/country_code_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/remote/country_codes_remote_data_source.dart';
import '../../data/repositories/country_codes_repository_impl.dart';
import '../../domain/usecases/get_country_codes_use_case.dart';
import '../manager/cubits/get_country_codes/get_country_codes_cubit.dart';


class CountryCodeForm extends StatefulWidget {
  final AirPortsParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Country> onCountryCodesChanged;

  const CountryCodeForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onCountryCodesChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _CountryCodeForm();
  }
}

class _CountryCodeForm extends State<CountryCodeForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetCountryCodesCubit(
            getCountryCodesUseCase: GetCountryCodesUseCase(
                codesRepository: CountryCodesRepositoryImpl(
                    codesRemoteDataSource:
                    CountryCodesRemoteDataSourceWithDio(dio: Dio()))))
          ..getCodes();
      },
      child: BlocConsumer<GetCountryCodesCubit, GetCountryCodesState>(
        listener: (context, state) {
          if (state is GetCountryCodesSuccess) {
            widget.param.countryCode = state.entity.data!.countries!.first.code;

          }
        },
        builder: (context, state) {
          if (state is GetCountryCodesLoading) {
            return CircularProgressIndicator();
          }
          if (state is GetCountryCodesEmpty) {
            return Center(child: Text(state.message),);
          }
          if (state is GetCountryCodesSuccess) {
            return CountryCodeChooser(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "countries",
                    items: state.entity.data!.countries!,
                  );
                },
                name: context.read<GetCountryCodesCubit>().name);
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<Country> items,

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
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () async {
                      ctx.read<GetCountryCodesCubit>().code = items[index].code!;
                      ctx.read<GetCountryCodesCubit>().name = items[index].countryName!;

                      widget.onCountryCodesChanged(items[index]);
                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text("${items[index].countryName!}"),
                  ),
                  Divider()
                ],
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
