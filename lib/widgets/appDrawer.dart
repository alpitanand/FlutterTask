import 'package:flutter/material.dart';
import 'package:kisanhub/screens/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('token', null);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Logout"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              _logout();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
