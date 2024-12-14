import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(1);
                },
                child: Text("Próximo")),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(0);
                },
                child: Text("Anterior"),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: Text("Próximo"),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.green,
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(1);
                },
                child: Text("Anterior")),
          ),
        ),
      ],
    );
  }
}