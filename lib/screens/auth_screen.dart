import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/screens/admin/admin_tabs_screen.dart';

import 'master/master_tabs_screen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(205, 124, 93, 1.0).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
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

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'id': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }),
              ],
            ));
  }

  Future<void> _submit() async {
    _formKey.currentState!.save();
    print(_authData['password']);
    if (_authData['id'] == '111111111') {
      Navigator.of(context).pushReplacementNamed(AdminTabsScreen.routName);
    }
    if (_authData['id'] == '222222222') {
      Navigator.of(context).pushReplacementNamed(MasterTabsScreen.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    //RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(30),
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        foreground: Theme.of(context).textTheme.button!.foreground,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      primary: Theme.of(context).primaryColor,
    );

    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: 350,
        constraints: BoxConstraints(minHeight: 300),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Welcome Back!',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 9) {
                      return 'Invalid ID!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['id'] = value as String;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value as String;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    child: Text('LOGIN'),
                    onPressed: () {
                      _submit();
                    },
                    style: elevatedButtonStyle,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
