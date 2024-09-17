import 'package:app_e_commerce_project/Ui/home/tabs/profile_tab/cubit/profile_screen_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/profile_tab/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileTabViewModel()..getProfile(),
      child: BlocBuilder<ProfileTabViewModel, ProfileTabStates>(
        builder: (context, state) {
          if (state is ProfileTabLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProfileTabErrorState) {
            return Center(child: Text('Error: ${state.errorMsg}'));
          } else if (state is ProfileTabSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.profile.avatarUrl!),
                  ),
                  SizedBox(height: 16),
                  Text(
                    state.profile.name!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.profile.email!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No profile data.'));
          }
        },
      ),
    );
  }
}