import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/user/domain/usecases/delete_document_use_case.dart';
import 'package:flightes/feature/user/presentation/manager/cubits/delete_document/delete_document_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constatnts/app_colors.dart';
import '../../../../main.dart';
import '../../data/data_source/remote/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user_documents_entity.dart';
import '../../domain/usecases/get_user_documents_use_case.dart';
import '../manager/cubits/get_user_documents/get_user_documents_cubit.dart';

const String IMAGE_BASE_URL = "http://10.0.2.2:8000/api/";

class UserDocuments extends StatelessWidget {
  final double height;
  final double width;

  const UserDocuments({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserDocumentsCubit(
          useCase: GetUserDocumentsUseCase(
              userRepository: UserRepositoryImpl(
                  userRemoteDataSource:
                      UserRemoteDataSourceWithDio(dio: Dio()))))
        ..getUserDocuments(userID!),
      child: BlocConsumer<GetUserDocumentsCubit, GetUserDocumentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetUserDocumentsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          if (state is GetUserDocumentsSuccess) {
            return RefreshIndicator(
                child: Container(
                  width: width,
                  height: height,
                  child: listOfDocuments(
                      state.entity.documents!, width, height / 1.5),
                ),
                onRefresh: () async {
                  context
                      .read<GetUserDocumentsCubit>()
                      .getUserDocuments(userID!);
                });
          }
          return const Center();
        },
      ),
    );
  }

  Widget listOfDocuments(
      List<OneUserDocument> list, double width, double height) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Center(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: height / 20),
              child: Container(
                width: width,
                height: height / 1.2,
                decoration:
                    BoxDecoration(border: Border.all(color: AppColors.blue2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/pdf.png"))),
                    ),
                    Text(
                      "${list[index].documentNumber}",
                      style: TextStyle(color: AppColors.orange1, fontSize: 25),
                    ),
                    Text("expire at : ${list[index].expiryDate}",
                        style: const TextStyle(
                            color: AppColors.orange1, fontSize: 20)),
//                     BlocProvider(create: (context) {
//                       return DeleteDocumentCubit(
//                           useCase: DeleteDocumentUseCase(
//                               userRepository: UserRepositoryImpl(
//                                   userRemoteDataSource:
//                                       UserRemoteDataSourceWithDio(
//                                           dio: Dio()))));
//                     },
//                     child: BlocConsumer<DeleteDocumentCubit,DeleteDocumentState>(
//                       listener: (context,state){
//                         if(state is DeleteDocumentSuccess){
//                           context.read<GetUserDocumentsCubit>()..getUserDocuments(userID!);
//                         }
//                         if(state is DeleteDocumentFailed){
// ScaffoldMessageUtil().customScaffoldMessenger(context, "delete failed", Colors.red);                        }
//                       },
//                       builder: (context,state){
//                         return
//                           IconButton(
//                               onPressed: () {
//                                 context.read<DeleteDocumentCubit>().deleteDocument(list[index].id!);
//                               },
//                            icon:
//
//                            (state is DeleteDocumentLoading)
//                             ?CircularProgressIndicator():Icon(
//                                 Icons.delete,
//                                 color: Colors.red,
//                               ));
//                         },
//                     ),),

                  ],
                ),
              ),
            )));
  }
}
