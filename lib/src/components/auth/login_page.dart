import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/theme.dart';
import '../../provider/auth_provider/auth_provider.dart';
import '../../widget/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    assert(() {
      emailController.text = 'eve.holt@reqres.in';
      passwordController.text = 'cityslicka';
      return true;
    }());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Consumer<AuthProvider>(
    builder: (context, authProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            child: Column(children: [
              AppTextField(
                controller: emailController,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Email is required.';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$",
                  ).hasMatch(v ?? '')) {
                    return 'Please enter valid email.';
                  }
                  return null;
                },
              ),
              AppTextField(
                controller: passwordController,
                isObscured: true,
                hint: 'Password',
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Password is required.';
                  } else if ((v?.length ?? 0) < 6) {
                    return 'Password must be 6 characters long.';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),
              ),

              authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : FilledButton(
                onPressed: () async {
                  if (!(formKey.currentState?.validate() ?? false)) {
                    autoValidateMode =
                        AutovalidateMode.onUserInteraction;
                    setState(() {});
                    return;
                  }

                  // Use the LoginProvider for login logic
                  await Provider.of<AuthProvider>(context,
                      listen: false)
                      .loginUser(
                    email: emailController.text.toLowerCase().trim(),
                    password: passwordController.text,
                    context: context,
                  );
                },
                child: const Text('Login'),
              ), const SizedBox(height: 24),
              RichText(
                text: const TextSpan(
                  text: 'New Member? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF808080),
                  ),
                  children: [
                    TextSpan(
                      text: 'Create an Account',
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ],
                ),
              ),
            ]),


          );}
        ),
      ),
    );
  }
}
