import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
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
                      backgroundColor: WidgetStateProperty.all(primaryColor)),
                  onPressed: () {},
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
    );
  }
}
