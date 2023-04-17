
import 'package:flutter/material.dart';
import 'package:kerwel/auth/presentation/RegisterScreen.dart';
import 'package:kerwel/auth/presentation/components/AuthTextField.dart';
import 'package:provider/provider.dart';

import 'LoginViewModel.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "home_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold (
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: ChangeNotifierProvider<LoginViewModel>(
          create: (BuildContext context) => viewModel,
          child: Consumer<LoginViewModel>(builder: (context, viewModel,_){
            return Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                      child: Container(
                          width: screenWidth,
                          alignment: Alignment.topCenter,
                          child: const Text(
                            "Flutter Test-App\nLogin",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                  width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(0, 3)
                          )
                        ]
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AuthTextField(
                              onValueChanged: viewModel.onEmailValueChange,
                              description: "Emailadresse",
                            ),
                            const SizedBox(height: 16),
                            AuthTextField(
                              onValueChanged: viewModel.onPasswordValueChange,
                              description: "Passwort",
                              isPasswordField: true,
                            ),
                            const SizedBox(height: 8,),
                            Text(viewModel.errorHint),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: viewModel.isLoginEnabled ? () => {

                                }: null,
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  )
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/register",
                              (route) => false
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Noch keinen Account?"),
                            SizedBox(width: 5),
                            Text("Registrieren", style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        )
    );
  }
}
