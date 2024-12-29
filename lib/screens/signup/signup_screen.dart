import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/helpers/validators.dart';
import 'package:loja_virtual_pro/models/user_app.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserApp userApp = UserApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return "Campo obrigatório";
                    } else if (name.trim().split(" ").length < 2) {
                      return "Preencha seu nome completo";
                    }

                    return null;
                  },
                  onSaved: (name) => userApp.name = name!,
                ),
                SizedBox(height: 16),
                TextFormField(
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Campo obrigatório";
                      } else if (!isValidEmail(email)) {
                        return "E-mail inválido";
                      }

                      return null;
                    },
                    onSaved: (email) {
                      userApp.email = email!;
                    }),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (pass) {
                    if (pass == null || pass.isEmpty) {
                      return "Campo obrigatório";
                    } else if (pass.length < 6) {
                      return "Senha muito curta";
                    }

                    return null;
                  },
                  onSaved: (pass) => userApp.password = pass!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Repita à senha"),
                  obscureText: true,
                  validator: (pass) {
                    if (pass == null || pass.isEmpty) {
                      return "Campo obrigatório";
                    } else if (pass.length < 6) {
                      return "Senha muito curta";
                    }

                    return null;
                  },
                  onSaved: (confirmPass) =>
                      userApp.confirmPassword = confirmPass!,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      if (userApp.password != userApp.confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("As senhas não coincidem!"),
                            backgroundColor: Colors.red,
                          ),
                        );

                        return;
                      }

                      // TODO: IMPLEMENTAR CÓDIGO PARA SALVAR DADOS DO NOVO USUÁRIO
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Theme.of(context).primaryColor),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
