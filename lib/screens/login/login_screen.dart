import 'package:firebase_auth/firebase_auth.dart';
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
                      onTap: () {},
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
                          backgroundColor:
                              WidgetStateProperty.all(primaryColor)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text;
                          String password = passController.text;
                          userManager.sigIn(UserApp(
                            email: email,
                            password: password,
                          ));
                        }
                      },
                      child: Text(
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
