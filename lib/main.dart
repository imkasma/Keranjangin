import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// Routes
import 'package:keranjangin/core/routes/app_routes.dart';
import 'package:keranjangin/core/routes/on_generate_route.dart';
import 'package:keranjangin/core/themes/app_themes.dart';

// Providers / ViewModels
import 'package:keranjangin/core/viewmodels/product_provider.dart';
import 'package:keranjangin/core/viewmodels/card_viewmodel.dart';
import 'package:keranjangin/core/viewmodels/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CardViewModel()),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ), // ✅ FIX DI SINI
      ],
      child: MaterialApp(
        title: 'Keranjangin',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        onGenerateRoute: RouteGenerator.onGenerate,
        initialRoute: AppRoutes.onboarding,
      ),
    );
  }
}