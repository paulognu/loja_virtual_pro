import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.iconData,
    required this.title,
    required this.page,
    super.key,
  });

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    int currentPage = context.watch<PageManager>().page;

    final Color activedColor = Theme.of(context).primaryColor;
    final Color? desactivedColor = Colors.grey[700];

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: currentPage == page ? activedColor : desactivedColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: currentPage == page ? activedColor : desactivedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
