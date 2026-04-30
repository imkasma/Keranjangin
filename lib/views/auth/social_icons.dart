import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';

class SocialIcons extends StatefulWidget {
  const SocialIcons({super.key});

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  bool isLoading = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    try {
      debugPrint("Klik Google login");

      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint("Login dibatalkan");
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _auth.signInWithCredential(credential);

      debugPrint("Login berhasil: ${userCredential.user?.email}");

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.entryPoint);
    } catch (e) {
      debugPrint("Error Google: $e");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Google gagal')),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void signInWithFacebook() {
    debugPrint("Login Facebook belum diimplementasikan");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: isLoading ? null : signInWithGoogle,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : SvgPicture.asset('assets/icons/google.svg'),
          iconSize: 48,
        ),
        IconButton(
          onPressed: signInWithFacebook,
          icon: SvgPicture.asset(AppIcons.facebookIcon),
          iconSize: 48,
        ),
      ],
    );
  }
}