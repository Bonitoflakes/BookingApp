import 'package:booking_app/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Colors.grey[300],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'example@rootquotient.com'),
                    ),
                    TextFormField(
                      controller: _password,
                      decoration:
                          const InputDecoration(hintText: 'Password@123'),
                      enableSuggestions: false,
                      obscureText: true,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final data = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (kDebugMode) {
                            print(data);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (kDebugMode) {
                            print("Something went wrong");
                          }
                          if (kDebugMode) {
                            print(e.runtimeType);
                          }
                          if (kDebugMode) {
                            print(e.code);
                          }
                          if (e.code == 'user-not-found') {
                            if (kDebugMode) {
                              print('user not found');
                            }
                          }
                        }
                      },
                      style: raisedButtonStyle,
                      child: const Text('Register'),
                    )
                  ],
                );
              default:
                return const Text('Loading....');
            }
          },
        ),
      ),
    );
  }
}
