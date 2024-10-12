import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/public/manager/file_manager/cubit/file_manager_cubit.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/user/data/data_source/remote/user_remote_data_source.dart';
import 'package:flightes/feature/user/data/repositories/user_repository_impl.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';
import 'package:flightes/feature/user/domain/usecases/add_documents_use_case.dart';
import 'package:flightes/feature/user/presentation/manager/cubits/add_document/add_document_cubit.dart';
import 'package:flightes/feature/user/presentation/widgets/country_name_form.dart';
import 'package:flightes/feature/user/presentation/widgets/document_type_form.dart';
import 'package:flightes/feature/user/presentation/widgets/documnet_form.dart';
import 'package:flightes/feature/user/presentation/widgets/hoolder_document.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDocumentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddDocumentScreen();
  }
}

class _AddDocumentScreen extends State<AddDocumentScreen> {
  final formState = GlobalKey<FormState>();
  bool isHolder = true;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Document"),
      ),
      body: BlocProvider(
        create: (context) {
          return AddDocumentCubit(
              useCase: AddDocumentsUseCase(
                  userRepository: UserRepositoryImpl(
                      userRemoteDataSource:
                          UserRemoteDataSourceWithDio(dio: Dio()))));
        },
        child: BlocConsumer<AddDocumentCubit, AddDocumentState>(
          listener: (context, state) {
            if(state is AddDocumentSuccess){
              ScaffoldMessageUtil().customScaffoldMessenger(context, "add document Success!", Colors.green);
            }
            if(state is AddDocumentFailed){
              ScaffoldMessageUtil().customScaffoldMessenger(context,state.message, Colors.green);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width,
                    height: height / 5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Main Information",
                        style: TextStyle(
                            color: AppColors.blue2,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: width / 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "document type",
                        style: TextStyle(color: AppColors.orange1),
                      ),
                      DocumentTypeForm(
                          height: height,
                          listWidth: width,
                          listHeight: height,
                          onDocumentChanged: (value) {
                            context
                                .read<AddDocumentCubit>()
                                .param
                                .documentTypeId = value.id;
                            context
                                .read<AddDocumentCubit>()
                                .param
                                .documentName = value.name;
                            context
                                .read<AddDocumentCubit>()
                                .param
                                .documentNumber = value.name;

                            setState(() {
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .documentTypeId
                                  .toString());
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .documentName
                                  .toString());
                            });
                          },
                          param: context.read<AddDocumentCubit>().param),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Birth Place",
                        style: TextStyle(color: AppColors.orange1),
                      ),
                      CountryNameForm(
                          height: height,
                          listWidth: width,
                          listHeight: height,
                          onDocumentChanged: (value) {
                            context.read<AddDocumentCubit>().param.birthPlace =
                                value;

                            setState(() {
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .birthPlace
                                  .toString());
                            });
                          },
                          param: context.read<AddDocumentCubit>().param),
                    ],
                  ),
                  DocumentForm(
                    formState: formState,
                    param: context.read<AddDocumentCubit>().param,
                    onChanged: (value) {
                      context.read<AddDocumentCubit>().param = value;
                      setState(() {});
                    },
                    width: width,
                    height: height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Issuance Country ",
                        style: TextStyle(color: AppColors.orange1),
                      ),
                      CountryNameForm(
                          height: height,
                          listWidth: width,
                          listHeight: height,
                          onDocumentChanged: (value) {
                            context
                                .read<AddDocumentCubit>()
                                .param
                                .issuanceCountry = value;

                            setState(() {
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .birthPlace
                                  .toString());
                            });
                          },
                          param: context.read<AddDocumentCubit>().param),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Another Information",
                        style: TextStyle(
                            color: AppColors.blue2,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: width / 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // HoolderDocument(
                  //     width: width / 1.5,
                  //     height: height / 6,
                  //     onPressedTrue: () {
                  //       context.read<AddDocumentCubit>().param.holder = 1;
                  //       isHolder = true;
                  //       setState(() {
                  //         log(context
                  //             .read<AddDocumentCubit>()
                  //             .param
                  //             .holder
                  //             .toString());
                  //       });
                  //     },
                  //     onPressedFalse: () {
                  //       context.read<AddDocumentCubit>().param.holder = 0;
                  //       isHolder = false;
                  //       setState(() {
                  //         log(context
                  //             .read<AddDocumentCubit>()
                  //             .param
                  //             .holder
                  //             .toString());
                  //       });
                  //     },
                  //     status: isHolder),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Validate Country",
                        style: TextStyle(color: AppColors.orange1),
                      ),
                      CountryNameForm(
                          height: height,
                          listWidth: width,
                          listHeight: height,
                          onDocumentChanged: (value) {
                            context
                                .read<AddDocumentCubit>()
                                .param
                                .validityCountry = value;

                            setState(() {
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .birthPlace
                                  .toString());
                            });
                          },
                          param: context.read<AddDocumentCubit>().param),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Nationality",
                        style: TextStyle(color: AppColors.orange1),
                      ),
                      CountryNameForm(
                          height: height,
                          listWidth: width,
                          listHeight: height,
                          onDocumentChanged: (value) {
                            context.read<AddDocumentCubit>().param.nationality =
                                value;

                            setState(() {
                              log(context
                                  .read<AddDocumentCubit>()
                                  .param
                                  .birthPlace
                                  .toString());
                            });
                          },
                          param: context.read<AddDocumentCubit>().param),
                    ],
                  ),
                  BlocProvider(
                    create: (context) => FileManagerCubit(),
                    child: BlocConsumer<FileManagerCubit, FileManagerState>(
                      listener: (context, state) {
                        if (state is FileManagerFailed) {
                          ScaffoldMessageUtil().customScaffoldMessenger(
                              context, state.message, Colors.red);
                        }
                        if (state is FileManagerSuccess) {
                          context.read<AddDocumentCubit>().param.file =
                              context.read<FileManagerCubit>().file;
                          log("file in param :");
                          log(context
                              .read<AddDocumentCubit>()
                              .param
                              .file
                              .toString());
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (context.read<AddDocumentCubit>().param.file !=
                                    null)
                                ? Container(
                                    width: width / 4,
                                    height: height / 5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/pdf.png"))),
                                  )
                                : Text("upload File"),
                            IconButton(
                                onPressed: () async {
                                  await context
                                      .read<FileManagerCubit>()
                                      .pickFile();
                                },
                                icon: const Icon(Icons.file_upload))
                          ],
                        );
                      },
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.blue2),
                      onPressed: () {
                        bool isValid = formState.currentState!.validate();
                        if(isValid) {
                          if(context
                              .read<AddDocumentCubit>()
                              .param.file!=null){
                          log("${context
                              .read<AddDocumentCubit>()
                              .param
                              .validityCountry}\n"
                              "${context
                              .read<AddDocumentCubit>()
                              .param
                              .nationality}\n"
                              "${context
                              .read<AddDocumentCubit>()
                              .param
                              .issuanceCountry}\n"
                              "${context
                              .read<AddDocumentCubit>()
                              .param
                              .expireDate}\n"
                              "${context
                              .read<AddDocumentCubit>()
                              .param
                              .storageDate}\n");
                          context.read<AddDocumentCubit>().addDocument();
                        }else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please add file"),backgroundColor: Colors.red,));
                          }

                        }
                        },
                      child: (state is AddDocumentLoading)
                          ? CircularProgressIndicator(
                              color: AppColors.blue2,
                            )
                          : Text(
                              "add document",
                              style: TextStyle(color: AppColors.white),
                            )),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
* */
