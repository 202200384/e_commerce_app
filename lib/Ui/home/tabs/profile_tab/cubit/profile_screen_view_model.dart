import 'package:app_e_commerce_project/Ui/home/tabs/profile_tab/cubit/profile_states.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/response/ProfileResponse.dart';

class ProfileTabViewModel extends Cubit<ProfileTabStates> {
  ProfileTabViewModel() : super(ProfileTabInitialState());

  void getProfile() async {
    try {
      emit(ProfileTabLoadingState());
      var response = await ApiManager.getProfile();
      if (response.statusMsg == 'fail') {
        emit(ProfileTabErrorState(errorMsg: response.message!));
      } else if (response.data != null) {
        // Assuming response.data is a Map and needs to be converted
        var profile = UserProfile.fromJson(response.data);
        emit(ProfileTabSuccessState(profile: profile));
      } else {
        emit(ProfileTabErrorState(errorMsg: 'Data is null'));
      }
    } catch (e) {
      emit(ProfileTabErrorState(errorMsg: e.toString()));
    }
  }
}