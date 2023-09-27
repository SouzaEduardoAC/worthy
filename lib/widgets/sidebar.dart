import 'package:flutter/material.dart';
import 'package:worthy/screens/login_screen.dart';
import 'package:worthy/utils/nav.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Eduardo Souza"),
                accountEmail: Text("mail@mail.com"),
                decoration: BoxDecoration(
                  color: Color(0xFF4CA237)
                ),
              ),
              ListTile(
                leading: Icon(Icons.house),
                title: Text('Home'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Item 1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Monthly Balance'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Item 1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.trending_up),
                title: Text('Investments'),
                subtitle: Text('Investments Overview'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Item 1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  pushReplacement(context, LoginScreen(controller: PageController(initialPage: 0)));
                },
              )
            ],
          ),
        )
    );
  }
}
