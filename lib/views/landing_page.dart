import 'package:flutter/material.dart';
import 'package:recebuddy_main/viewmodels/landing_page_viewmodel.dart';

class LandingPage extends StatelessWidget {
  final LandingPageViewModel viewModel = LandingPageViewModel();

  LandingPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // Added for scrolling when keyboard appears
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome to International Recipes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () => viewModel.navigateToLogin(context,
                    _usernameController.text, _passwordController.text),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => viewModel.navigateToRegister(context),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
