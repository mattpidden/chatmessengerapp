import 'package:chatmessengerapp/Components/my_button.dart';
import 'package:chatmessengerapp/Components/my_text_field.dart';
import 'package:chatmessengerapp/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in function
  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
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
                "Welcome back you've been missed!",
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

              //sign in button
              const SizedBox(
                height: 50,
              ),
              MyButton(onTap: signIn, text: "Sign In"),

              //register now
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Register Now",
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
