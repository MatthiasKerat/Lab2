
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RegisterViewModel.dart';
import 'components/AuthTextField.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "home_screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final RegisterViewModel viewModel = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: ChangeNotifierProvider<RegisterViewModel>(
          create: (BuildContext context) => viewModel,
          child: Consumer<RegisterViewModel>(builder: (context, viewModel,_){
            return Center(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: const Text(
                                "Flutter Test-App\nRegistrierung",
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
                                  const SizedBox(height: 16),
                                  AuthTextField(
                                    onValueChanged: viewModel.onPasswordRepeatedValueChange,
                                    description: "Passwort wiederholen",
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
                                          'Registrieren',
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
                                  "/login",
                                      (route) => false
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Bereits angemeldet?"),
                                SizedBox(width: 5),
                                Text("Login", style: TextStyle(color: Colors.blue)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            );
          }
        )
      )
    );
  }

}
