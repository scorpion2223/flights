
import 'package:dio/dio.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/feature/hotels/presentation/widgets/city_code_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/public/feature/iata_codes/data/data_sources/remote/iata_codes_remote_data_source.dart';
import '../../../../core/public/feature/iata_codes/data/repositories/iata_codes_repository_impl.dart';
import '../../../../core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';
import '../../../../core/public/feature/iata_codes/domian/usecases/get_iata_codes_use_case.dart';
import '../../../../core/public/feature/iata_codes/presentaion/manager/cubits/iata_codes/get_iata_codes_cubit.dart';


class KeyWordForm extends StatefulWidget {
  final AirPortsParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Datum> onIataCodesChanged;

  const KeyWordForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onIataCodesChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _KeyWordForm();
  }
}

class _KeyWordForm extends State<KeyWordForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetIataCodesCubit(
            getIataCodesUseCase: GetIataCodesUseCase(
                iataCodesRepository: IataCodesRepositoryImpl(
                    iataCodesRemoteDataSource:
                    IataCodesRemoteDataSourceWithDio(dio: Dio()))))
          ..getCodes();
      },
      child: BlocConsumer<GetIataCodesCubit, GetIataCodesState>(
        listener: (context, state) {
          if (state is GetIataCodesSuccess) {

            widget.param.keyword = state.entity.data!.first.code;

          }
        },
        builder: (context, state) {
          if (state is GetIataCodesLoading) {
            return CircularProgressIndicator();
          }
          if (state is GetIataCodesEmpty) {
            return Center(child: Text(state.message),);
          }
          if (state is GetIataCodesFailed) {
            return Center(child: IconButton(onPressed: (){
              context.read<GetIataCodesCubit>().getCodes();
            },icon: Icon(Icons.change_circle_sharp),),);
          }
          if (state is GetIataCodesSuccess) {
            return CityCodeChooser(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "cities",
                    items: state.entity.data!,
                  );
                },
                name: context.read<GetIataCodesCubit>().name1);
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<Datum> items,

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
                      ctx.read<GetIataCodesCubit>().code = items[index].code!;
                      ctx.read<GetIataCodesCubit>().name1 = items[index].name!;

                      widget.onIataCodesChanged(items[index]);
                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text(" ${items[index].name!}"),
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
