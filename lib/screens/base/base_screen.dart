import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/common/custom_drawer.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:loja_virtual_pro/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          LoginScreen(),
          Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            drawer: CustomDrawer(),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Produtos"),
            ),
            drawer: CustomDrawer(),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Meus Pedidos"),
            ),
            drawer: CustomDrawer(),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Lojas"),
            ),
            drawer: CustomDrawer(),
          ),
        ],
      ),
    );
  }
}
