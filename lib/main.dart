import 'package:flutter/material.dart';
import 'package:kisanhub/providers/activity.dart';
import 'package:kisanhub/providers/login.dart';
import 'package:kisanhub/screens/activitesScreen.dart';
import 'package:kisanhub/screens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print(token);
  runApp(MyApp(token));
}

class MyApp extends StatelessWidget {
  final String token;
  MyApp(this.token);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Login(),
        ),
        ChangeNotifierProvider.value(
          value: Activity(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: token == null ? LoginScreen() : ActivityScreen(),
        routes: {
          ActivityScreen.routeName: (ctx) => ActivityScreen(),
          LoginScreen.routeName:(ctx)=>LoginScreen()
        },
      ),
    );
  }
}
