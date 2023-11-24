import 'package:flutter/material.dart';
import 'package:recebuddy_main/views/home_page.dart';

class LandingPageViewModel {
  void navigateToLogin(BuildContext context, String username, String password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void navigateToRegister(BuildContext context) {}
}
