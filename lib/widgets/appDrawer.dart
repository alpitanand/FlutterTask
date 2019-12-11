import 'package:flutter/material.dart';
import 'package:kisanhub/providers/activity.dart';
import 'package:kisanhub/screens/loginScreen.dart';
import 'package:provider/provider.dart';
import '../providers/login.dart';

class AppDrawer extends StatelessWidget {

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
              // _logout();
              Provider.of<Activity>(context).clearData();
              Provider.of<Login>(context).logOut();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
