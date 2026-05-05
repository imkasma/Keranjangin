import 'package:flutter/material.dart';

import 'package:keranjangin/core/components/network_image.dart';
import 'package:keranjangin/core/constants/constants.dart';
import 'package:keranjangin/views/profile/components/profile_header_options.dart';

class ProfileHeader extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Image.asset(
          'assets/images/profile_page_background.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        /// Content
        Column(
          children: [
            AppBar(
              title: const Text('Profile'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            _UserData(profile: profile),

            const ProfileHeaderOptions(),
          ],
        ),
      ],
    );
  }
}

class _UserData extends StatelessWidget {
  final Map<String, dynamic> profile;

  const _UserData({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Row(
        children: [
          const SizedBox(width: AppDefaults.padding),

          /// Avatar
          const SizedBox(
            width: 100,
            height: 100,
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: NetworkImageWithLoader('https://i.pravatar.cc/150'),
              ),
            ),
          ),

          const SizedBox(width: AppDefaults.padding),

          /// Name & Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile['name']?.toString() ?? 'No Name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  profile['email']?.toString() ?? 'No Email',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}