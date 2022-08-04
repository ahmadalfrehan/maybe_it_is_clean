import 'package:flutter/material.dart';

class AppBarForMyApp {
  static AppBar appBarForMyApp(
    BuildContext context, {
    required String textAppBar,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        textAppBar,
        style: Theme.of(context).textTheme.headline3,
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (textAppBar != 'شؤون الموظفين') {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(
            textAppBar == 'شؤون الموظفين'
                ? Icons.add_circle_outlined
                : Icons.arrow_forward_ios,
            color: textAppBar == 'شؤون الموظفين' ? Colors.orange : Colors.black,
            size: 30,
          ),
        ),
      ],
    );
  }
}
