import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Nome Completo"),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: "Repita à senha"),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
