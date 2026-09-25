import 'package:flowee_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: DummyUser.email);
  final _passwordController = TextEditingController(text: DummyUser.password);
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}