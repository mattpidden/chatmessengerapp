import 'package:chatmessengerapp/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/my_button.dart';
import '../Components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up method
  void signUp() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.registerWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.message,
                size: 80,
                color: Colors.amber,
              ),

              //welcome back message
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Please register to use this amazing app",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              //email textfield
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Email address",
                  obscureText: false),

              //password textfield
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),

              //password textfield
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Repeat Password",
                  obscureText: true),

              //register button
              const SizedBox(
                height: 50,
              ),
              MyButton(onTap: signUp, text: "Register"),

              //register now
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
