import 'package:flutter/material.dart';
import 'package:kisanhub/screens/activitesScreen.dart';
import '../models/loginDetails.dart';
import 'package:provider/provider.dart';
import '../providers/login.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  final _passwordFocusNode = FocusNode();

  var _loginDetails = new LoginDetails(
    id: "",
    password: "",
  );

  void _saveForm() async {
    final loginDetails = Provider.of<Login>(context);
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    loginDetails.isLoggingIn();
    await loginDetails.logIn(_loginDetails);

    if (loginDetails.getIsLoggedIn()) {
      Navigator.of(context).pushReplacementNamed(ActivityScreen.routeName);
    }
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginDetails = Provider.of<Login>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                  child: Image.asset('assets/images/kisan.png',
                      height: 100, fit: BoxFit.contain)),
              SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => {
                  FocusScope.of(context).requestFocus(_passwordFocusNode),
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginDetails = LoginDetails(
                    id: value,
                    password: _loginDetails.password,
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                textInputAction: TextInputAction.next,
                obscureText: true,
                focusNode: _passwordFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginDetails = LoginDetails(
                    id: _loginDetails.id,
                    password: value,
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    minWidth: 150.0,
                    child: loginDetails.getIsLoggingIn()
                        ? CircularProgressIndicator()
                        : OutlineButton(
                            child: const Text('Login'),
                            onPressed: () {
                              _saveForm();
                            },
                            borderSide: BorderSide(color: Colors.green),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
