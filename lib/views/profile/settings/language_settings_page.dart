import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/app_back_button.dart';
import '../../../core/components/app_settings_tile.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/themes/app_themes.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text(
          'Language Settings',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(AppDefaults.padding),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDefaults.padding,
            vertical: AppDefaults.padding * 2,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDefaults.borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: const Column(
            children: [
              _SearchField(),
              _SuggestedLanguage(),
              _AllCountries(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme.copyWith(
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: AppColors.placeholder),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Type a word',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: SvgPicture.asset(
              AppIcons.search,
              colorFilter: const ColorFilter.mode(
                Colors.deepPurpleAccent,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(),
        ),
      ),
    );
  }
}

class _SuggestedLanguage extends StatelessWidget {
  const _SuggestedLanguage();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDefaults.padding),
        Text(
          'Suggested',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: AppDefaults.padding),
        AppSettingsListTile(label: 'Bangladesh'),
        AppSettingsListTile(label: 'Canada'),
        AppSettingsListTile(label: 'Australia'),
        AppSettingsListTile(
          label: 'United States',
          trailing: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class _AllCountries extends StatelessWidget {
  const _AllCountries();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDefaults.padding),
        Text(
          'All Countries/Regions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: AppDefaults.padding),
        AppSettingsListTile(label: 'Bangladesh'),
        AppSettingsListTile(label: 'Canada'),
        AppSettingsListTile(label: 'Cuba'),
        AppSettingsListTile(label: 'Spain'),
        AppSettingsListTile(label: 'Australia'),
        AppSettingsListTile(label: 'Greece'),
      ],
    );
  }
}