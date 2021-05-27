import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Icon(Icons.person),
            ),
            accountName: Text('Kindas'),
            accountEmail: Text('pedro.quindin@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Trends'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Minhas Acões'),
            onTap: () {
              Navigator.of(context).pushNamed('/trader');
            },
          )
        ],
      ),
    );
  }
}
