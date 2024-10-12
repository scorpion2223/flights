
import 'package:dio/dio.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/presentation/widgets/document_type_choose.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_documents_type_use_case.dart';
import '../manager/cubits/get_documents_type/get_documents_type_cubit.dart';


class DocumentTypeForm extends StatefulWidget {
  final DocumentParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<OneDocument> onDocumentChanged;

  const DocumentTypeForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onDocumentChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _DocumentTypeForm();
  }
}

class _DocumentTypeForm extends State<DocumentTypeForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetDocumentsTypeCubit(
            useCase: GetDocumentsTypeUseCase(
                userRepository:UserRepositoryImpl(
                    userRemoteDataSource:
                    UserRemoteDataSourceWithDio(dio: Dio()))))
          ..getDocumentsType();
      },
      child: BlocConsumer<GetDocumentsTypeCubit, GetDocumentsTypeState>(
        listener: (context, state) {
          if (state is GetDocumentsTypeSuccess) {
            if(state.entity.documents!.isNotEmpty){
            widget.param.documentTypeId = state.entity.documents!.first.id;
            widget.param.documentName = state.entity.documents!.first.name;
            widget.param.documentNumber = state.entity.documents!.first.name;

            }

          }
        },
        builder: (context, state) {
          if (state is GetDocumentsTypeLoading) {
            return CircularProgressIndicator();
          }
          // if (state is GetDocumentsTypeEmpty) {
          //   return Center(child: Text(state.message),);
          // }
          if (state is GetDocumentsTypeSuccess) {
            return DocumentTypeChoose(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "document type",
                    items: state.entity.documents!,
                  );
                },
                name: "${context.read<GetDocumentsTypeCubit>().name}");
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<OneDocument> items,

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
                children:
                [
                  TextButton(
                    onPressed: () async {
                      ctx.read<GetDocumentsTypeCubit>().name = items[index].name!;

                      widget.onDocumentChanged(items[index]);
                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text("${items[index].name!}"),
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
