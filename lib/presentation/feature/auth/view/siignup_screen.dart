import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_authflow/presentation/feature/auth/view_model/auth_vm.dart';
import 'package:supabase_authflow/presentation/feature/auth/widgets/custom_button.dart';
import 'package:supabase_authflow/presentation/feature/auth/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                Container(
                  height: 700,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back, size: 20),
                        const SizedBox(height: 20),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              children: [
                                TextSpan(
                                  text: ' Login',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ), textScaler: TextScaler.linear(1.0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Full Name',
                          hint: 'Enter your full name',
                          controller: authVm.usernameController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                          controller: authVm.emailController,
      
                          
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'Birthdate',
                          hint: 'Enter your birthdate',
                          controller: authVm.dateOfBirthController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'Phone Number',
                          hint: 'Enter your phone number',
                          controller: authVm.phoneNumberController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'Set Password',
                          hint: 'Enter your password',
                          controller: authVm.passwordController,
                        ),
                        const SizedBox(height: 30),
                       CustomButton(
                            text: authVm.isLoading ? 'Registering...' : 'Register',
                            onPressed: authVm.isLoading
                                ? () {}
                                : () {
                                    authVm.signUpWithEmail(
                                      authVm.emailController.text.trim(),
                                      authVm.passwordController.text.trim(),
                                    ).then((_) {
                                      if (authVm.errorMessage != null) {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(authVm.errorMessage!),
                                          ),
                                        );
                                      }
                                    });
                                  },
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
