part of 'announcement_trip_cubit.dart';

@immutable
abstract class AnnouncementTripState {}

class AnnouncementTripInitial extends AnnouncementTripState {}

class AnnouncementTripSuccess extends AnnouncementTripState {
  final String message;

  AnnouncementTripSuccess({required this.message});
}

class AnnouncementTripFailed extends AnnouncementTripState {
  final String message;

  AnnouncementTripFailed({required this.message});
}

class AnnouncementTripLoading extends AnnouncementTripState {}
