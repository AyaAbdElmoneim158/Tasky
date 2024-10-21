import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/profile_response.dart';
import '../../data/repos/profile_repo.dart';
part 'profile_state.dart';

// debugPrint("ProfileErrorState: getProfile ");
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  void getProfile() async {
    emit(ProfileLoadingState());
    debugPrint("ProfileLoadingState: getProfile ");
    final response = await _profileRepo.getProfile();
    response.fold(
      (error) {
        emit(ProfileErrorState(error));
        debugPrint("ProfileErrorState: getProfile ");
      },
      (profileResponse) {
        emit(ProfileSuccessState(profileResponse: profileResponse));
        debugPrint("ProfileSuccessState: getProfile ");
      },
    );
  }

  void logout() async {
    emit(ProfileLoadingState());
    debugPrint("ProfileLoadingState: logout ");
    final response = await _profileRepo.logout();
    response.fold((error) {
      emit(ProfileErrorState(error));
      debugPrint("ProfileErrorState: logout ");
    }, (profileResponse) {
      emit(ProfileSuccessState());
      debugPrint("ProfileSuccessState: logout ");
    });
  }
}
