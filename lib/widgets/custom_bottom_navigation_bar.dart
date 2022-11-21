import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/providers.dart';
import '../routes/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final selectedMenuOpt = menuProvider.selectedMenuOpt;

    return BottomNavigationBar(
      backgroundColor: Colors.indigo.shade600,
      elevation: 0,
      fixedColor: Colors.indigo.shade100,
      unselectedItemColor: Colors.indigo.shade300,
      currentIndex: selectedMenuOpt,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        menuProvider.selectedMenuOpt = index;
        switch (index) {
          case 0:
            Navigator.of(context).popAndPushNamed("home");
            break;
          case 1:
            Navigator.of(context).popAndPushNamed("transactions");
            break;
          case 2:
            Navigator.of(context).popAndPushNamed("send");
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.house,
          ),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bolt,
            size: 36,
          ),
          label: "Transacciones",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.solidPaperPlane,
          ),
          label: "Enviar",
        ),
      ],
    );
  }
}
