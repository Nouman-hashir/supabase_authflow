// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_authflow/presentation/feature/auth/view/siignup_screen.dart';
import 'package:supabase_authflow/presentation/feature/auth/view_model/auth_vm.dart';
import 'package:supabase_authflow/presentation/feature/auth/widgets/custom_button.dart';
import 'package:supabase_authflow/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:supabase_authflow/presentation/feature/auth/widgets/cutsom_icon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthVm>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF2567E8), const Color(0xFF1CE6DA)],
              ),
            ),
          ),
          Center(
            child: Column(
              spacing: 7,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png', width: 200),
                const SizedBox(height: 20),
                Container(
                  height: 600,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign up',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                          controller: authVm.emailController,
                        ),
                        CustomTextField(
                          label: 'Password',
                          hint: 'Enter your password',
                          controller: authVm.passwordController,
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},

                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                            ),
                            const Text('Remember me'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Login',
                          onPressed: () {
                            authVm
                                .loginWithEmail(
                                  authVm.emailController.text.trim(),
                                  authVm.passwordController.text.trim(),
                                )
                                .then((_) {
                                  if (authVm.isVerified) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Login Successful!'),
                                      ),
                                    );
                                  } else if (authVm.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(authVm.errorMessage!),
                                      ),
                                    );
                                  }
                                });
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Or'),
                        const SizedBox(height: 20),
                        CustomSocialButton(
                          text: 'Continue with Google',
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomSocialButton(
                          text: 'Continue with Facebook',
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/fb_logo.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
