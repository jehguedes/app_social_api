import 'package:app_social_api/screens/HomePage.dart';
import 'package:app_social_api/screens/UserPerfil.dart';
import 'package:app_social_api/service/placeholder_service.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final _placeholderService = PlaceholderService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text(
              'Feed',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              debugPrint('Feed');
            },
          ),
          ListTile(
            title: Text(
              'Perfil',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              _placeholderService.getPerfil().then((user) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Perfil(user),
                  ),
                );
              });
              debugPrint('Perfil');
            },
          ),
        ],
      ),
    );
  }
}
