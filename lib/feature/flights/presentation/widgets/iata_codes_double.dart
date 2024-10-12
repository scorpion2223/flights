
import 'package:dio/dio.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/public/feature/iata_codes/data/data_sources/remote/iata_codes_remote_data_source.dart';
import '../../../../core/public/feature/iata_codes/data/repositories/iata_codes_repository_impl.dart';
import '../../../../core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';
import '../../../../core/public/feature/iata_codes/domian/usecases/get_iata_codes_use_case.dart';
import '../../../../core/public/feature/iata_codes/presentaion/manager/cubits/iata_codes/get_iata_codes_cubit.dart';
import '../../../../core/public/feature/iata_codes/presentaion/widgets/code_chooser.dart';


class IataCodesDouble extends StatefulWidget {
  final SearchParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Datum> onIataCodesChanged;
  final ValueChanged<Datum> onIataCodesChanged2;

  const IataCodesDouble(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onIataCodesChanged,
        required this.param, required this.onIataCodesChanged2});

  @override
  State<StatefulWidget> createState() {
    return _IataCodesDouble();
  }
}

class _IataCodesDouble extends State<IataCodesDouble> {
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
            // widget.param.originLocationCode = state.entity.data!.first.code;
            // widget.param.destinationLocationCode = state.entity.data!.first.code;

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
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ Text("Origin Location",style: TextStyle(color: AppColors.orange2),),
                  CodeChooser(
                      height: widget.height / 40,
                      status: false,
                      onPressed: () {
                        _showListDialog(context,
                          alertDialogTitle: "cities",
                          items: state.entity.data!,
                        );
                      },
                      name: context.read<GetIataCodesCubit>().name1),
               ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ Text("Destination Location",style: TextStyle(color: AppColors.orange2),),
                  CodeChooser(
                      height: widget.height / 40,
                      status: false,
                      onPressed: () {
                        _showListDialog2(context,
                          alertDialogTitle: "cities",
                          items: state.entity.data!,
                        );
                      },
                      name: context.read<GetIataCodesCubit>().name2)
                ],),


            ],);
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
                    child: Text("${index+1} : ${items[index].name!}"),
                  ),
                  Divider(),
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
  void _showListDialog2(
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
                      ctx.read<GetIataCodesCubit>().code2 = items[index].code!;
                      ctx.read<GetIataCodesCubit>().name2 = items[index].name!;

                      widget.onIataCodesChanged2(items[index]);
                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text("${index+1} : ${items[index].name!}"),
                  ),
                  Divider(),
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
