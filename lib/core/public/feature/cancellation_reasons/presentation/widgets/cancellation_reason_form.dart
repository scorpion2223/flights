
import 'package:dio/dio.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/entities/cancellation_reasons_entity.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/presentation/widgets/cancellation_reason_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/remote/cancellation_reasons_remote_data_source.dart';
import '../../data/repositories/cancellation_reasons_repository_impl.dart';
import '../../domain/usecases/get_cancellation_reasons_use_case.dart';
import '../manager/cubits/get_cancellation_reasons/get_cancellation_reasons_cubit.dart';



class CancellationReasonsForm extends StatefulWidget {

  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Datum> onCancellationReasonsChanged;

  const CancellationReasonsForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onCancellationReasonsChanged,
      });

  @override
  State<StatefulWidget> createState() {
    return _CancellationReasonsForm();
  }
}

class _CancellationReasonsForm extends State<CancellationReasonsForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetCancellationReasonsCubit(
            getCancellationReasonsUseCase: GetCancellationReasonsUseCase(
                cancellationReasonsRepository: CancellationReasonsRepositoryImpl(
                    cancellationReasonsRemoteDataSource:
                    CancellationReasonsRemoteDataSourceWithDio(dio: Dio()))))
          ..getData();
      },
      child: BlocConsumer<GetCancellationReasonsCubit, GetCancellationReasonsState>(
        listener: (context, state) {
          if (state is GetCancellationReasonsSuccess) {


          }
        },
        builder: (context, state) {
          if (state is GetCancellationReasonsLoading) {
            return CircularProgressIndicator();
          }
          if (state is GetCancellationReasonsSuccess) {
            return CancellationReasonChooser(
                height: widget.height / 15,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                      alertDialogTitle: "reasons",
                      items: state.entity.data!,
                      onItemSelected: (item) {});
                },
                name: context.read<GetCancellationReasonsCubit>().reason);
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
        required ValueChanged<Datum> onItemSelected,
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
                  ctx.read<GetCancellationReasonsCubit>().reason = items[index].reason!;
                  onItemSelected(items[index]);
                  widget.onCancellationReasonsChanged(items[index]);
                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text(items[index].reason!),
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
