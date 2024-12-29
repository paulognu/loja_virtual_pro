import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/helpers/validators.dart';
import 'package:loja_virtual_pro/models/user_app.dart';
import 'package:loja_virtual_pro/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Consumer<UserManager>(
      builder: (context, userManager, widget) => Scaffold(
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/signup");
              },
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    enabled: !userManager.isLoading,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (email == null || isValidEmail(email) == false) {
                        return "E-mail inválido!";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    enabled: !userManager.isLoading,
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: "Senha",
                    ),
                    obscureText: true,
                    validator: (pass) {
                      if (pass == null || pass.isEmpty || pass.length < 6) {
                        return "Senha inválida!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: userManager.isLoading ? null : () {},
                      child: Text(
                        "Esqueci minha senha",
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: userManager.isLoading
                              ? WidgetStateProperty.all(
                                  primaryColor.withAlpha(100))
                              : WidgetStateProperty.all(primaryColor)),
                      onPressed: userManager.isLoading
                          ? null
                          : () async {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String password = passController.text;
                                userManager.sigIn(
                                  UserApp(
                                    email: email,
                                    password: password,
                                  ),
                                  onFail: (message) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Falha ao entrar: $message"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                  onSuccess: () {
                                    // TODO: FECHAR TELA DE LOGIN
                                  },
                                );
                              }
                            },
                      child: userManager.isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
