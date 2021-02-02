import 'package:app_social_api/models/user_model.dart';
import 'package:app_social_api/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  final User user;
  Perfil(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${user.name}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    'Usuário: ${user.username}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Email: ${user.email}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Telefone: ${user.phone}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Site: ${user.website}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Endereço',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    'Rua: ${user.address.street}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Complemento: ${user.address.suite}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Cidade: ${user.address.city}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'CEP: ${user.address.zipcode}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
