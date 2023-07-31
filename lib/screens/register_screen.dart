import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _passwordConfirmController =
    TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create Account',
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: _emailController,
                      style: const TextStyle(),
                      decoration:
                          const InputDecoration(label: Text('Enter Email'))),
                  TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(label: Text('Enter Password'))),
                  TextField(
                      controller: _passwordConfirmController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          label: Text('Enter Confrim Password'))),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
