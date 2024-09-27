part of 'get_announcements_cubit.dart';

@immutable
abstract class GetAnnouncementsState {}

class GetAnnouncementsInitial extends GetAnnouncementsState {}

class GetAnnouncementsSuccess extends GetAnnouncementsState {
  final AnnouncementsEntity entity;

  GetAnnouncementsSuccess({required this.entity});
}

class GetAnnouncementsFailed extends GetAnnouncementsState {
  final String message;

  GetAnnouncementsFailed({required this.message});
}

class GetAnnouncementsLoading extends GetAnnouncementsState {}
