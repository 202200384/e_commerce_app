
import 'package:app_e_commerce_project/data/model/response/ProfileResponse.dart';

abstract class ProfileTabStates {}
class ProfileTabInitialState extends ProfileTabStates {}
class ProfileTabLoadingState extends ProfileTabStates {}
class ProfileTabErrorState extends ProfileTabStates {
  final String errorMsg;
  ProfileTabErrorState({required this.errorMsg});
}
class ProfileTabSuccessState extends ProfileTabStates {
  final UserProfile profile;
  ProfileTabSuccessState({required this.profile});
}