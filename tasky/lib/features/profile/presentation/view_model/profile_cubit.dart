import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_repo.dart';
import '../../data/repos/profile_repo.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  void getProfile() async {
    emit(ProfileLoadingState());
    final response = await _profileRepo.getProfile();
    response.fold(
      (error) => emit(ProfileErrorState(error)),
      (profileResponse) => emit(ProfileSuccessState(profileResponse)),
    );
  }
}
