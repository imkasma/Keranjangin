import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:keranjangin/core/constants/app_colors.dart';
import 'package:keranjangin/core/viewmodels/profile_provider.dart';
import 'package:keranjangin/views/profile/components/profile_header.dart';
import 'package:keranjangin/views/profile/components/profile_menu_options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    // aman dari context error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileViewModel>().fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (_) {
            // 🔄 Loading
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // ❌ Error
            if (vm.error != null) {
              return Center(child: Text("Error: ${vm.error}"));
            }

            // ⚠️ No data
            if (vm.profile == null) {
              return const Center(child: Text("No Profile Data"));
            }

            // ✅ Success
            return SingleChildScrollView(
              child: Container(
                color: AppColors.cardColor,
                child: Column(
                  children: [
                    ProfileHeader(profile: vm.profile!),
                    const ProfileMenuOptions(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}