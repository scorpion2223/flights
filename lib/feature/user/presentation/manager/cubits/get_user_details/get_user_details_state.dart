part of 'get_user_details_cubit.dart';

@immutable
abstract class GetUserDetailsState {}

class GetUserDetailsInitial extends GetUserDetailsState {}

class GetUserDetailsSuccess extends GetUserDetailsState {
  final UserDetailsEntity entity;

  GetUserDetailsSuccess({required this.entity});
}
class GetUserDetailsFailed extends GetUserDetailsState {
  final String message;

  GetUserDetailsFailed({required this.message});
}
class GetUserDetailsLoading extends GetUserDetailsState {}

