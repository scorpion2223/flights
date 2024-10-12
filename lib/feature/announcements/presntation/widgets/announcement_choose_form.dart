

import 'package:dio/dio.dart';
import 'package:flightes/core/params/announcements_param.dart';
import 'package:flightes/feature/announcements/presntation/widgets/announcement_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/public/feature/iata_codes/data/repositories/iata_codes_repository_impl.dart';
import '../../data/data_sources/remote/announcements_remote_data_source.dart';
import '../../data/repositories/announcements_repository_impl.dart';
import '../../domain/entities/announcements_entity.dart';
import '../../domain/usecases/get_announcements_use_case.dart';
import '../manager/cubits/get_announcements/get_announcements_cubit.dart';

class AnnouncementChooseForm extends StatefulWidget {
  final AnnouncementsParam param;
  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Announcement> onAnnouncementsChanged;

  const AnnouncementChooseForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onAnnouncementsChanged,
        required this.param});

  @override
  State<StatefulWidget> createState() {
    return _AnnouncementChooseForm();
  }
}

class _AnnouncementChooseForm extends State<AnnouncementChooseForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetAnnouncementsCubit(
            useCase: GetAnnouncementsUseCase(
                repository: AnnouncementsRepositoryImpl(
                    remoteDataSource:
                    AnnouncementsRemoteDataSourceWithDio(dio: Dio()))))
          ..getAnnouncements();
      },
      child: BlocConsumer<GetAnnouncementsCubit, GetAnnouncementsState>(
        listener: (context, state) {
          if (state is GetAnnouncementsSuccess) {

            widget.param.announcementId = state.entity.data!.announcements!.first.id;

          }
        },
        builder: (context, state) {
          if (state is GetAnnouncementsLoading) {
            return CircularProgressIndicator();
          }

          if (state is GetAnnouncementsFailed) {
            return Center(child: IconButton(onPressed: (){
              context.read<GetAnnouncementsCubit>().getAnnouncements();
            },icon: Icon(Icons.change_circle_rounded),),);
          }
          if (state is GetAnnouncementsSuccess) {
            return AnnouncementChoose(
                height: widget.height / 40,
                status: false,
                onPressed: () {
                  _showListDialog(context,
                    alertDialogTitle: "Issues",
                    items: state.entity.data!.announcements!,
                  );
                },
                name: context.read<GetAnnouncementsCubit>().name!,
            width: widget.listWidth/1.2,);
          }
          return Center();
        },
      ),
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<Announcement> items,

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
                      ctx.read<GetAnnouncementsCubit>().name = items[index].name!;

                      widget.onAnnouncementsChanged(items[index]);
                      setState(() {});

                      Navigator.pop(context);
                    },
                    child: Text("${index+1} : ${items[index].name!}"),
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
