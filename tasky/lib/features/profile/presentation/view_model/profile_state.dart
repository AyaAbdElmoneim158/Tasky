part of 'profile_cubit.dart';

class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileResponse? profileResponse;
  ProfileSuccessState({this.profileResponse});
}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}
