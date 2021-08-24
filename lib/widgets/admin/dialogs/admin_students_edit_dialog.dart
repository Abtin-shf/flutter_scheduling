import 'package:flutter/material.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/users_provider.dart';
import 'package:provider/provider.dart';

class AdminStudentsEditDialog extends StatefulWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String code;
  final EditOrAdd editOrAdd;

  AdminStudentsEditDialog(
      {required this.firstName,
      required this.code,
      required this.editOrAdd,
      required this.lastName,
      required this.id});

  @override
  _AdminStudentsEditDialogState createState() =>
      _AdminStudentsEditDialogState();
}

class _AdminStudentsEditDialogState extends State<AdminStudentsEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _studentData = {
    'firstName': '',
    'lastName': '',
    'code': '',
    'password': '',
  };

  void _submit() {
    _formKey.currentState!.save();
    final users = Provider.of<UsersProvider>(context);
    if (widget.editOrAdd == EditOrAdd.Add) {
      users.addSingleUser(
          _studentData['firstName'] as String,
          _studentData['lastName'] as String,
          _studentData['password'] as String,
          _studentData['code'] as String,
          'ROLE_STUDENT');
    }
    if (widget.editOrAdd == EditOrAdd.Edit) {
      users.editUser(
        widget.id,
        _studentData['firstName'] as String,
        _studentData['lastName'] as String,
        _studentData['code'] as String,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: widget.editOrAdd == EditOrAdd.Edit ? 300 : 350,
          width: 200,
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.firstName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid First Name!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _studentData['firstName'] = value as String;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.lastName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Last Name!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _studentData['lastName'] = value as String;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Code',
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: widget.code,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Code!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _studentData['code'] = value as String;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  widget.editOrAdd == EditOrAdd.Add
                      ? TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          keyboardType: TextInputType.text,
                          initialValue: widget.code,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalid Code!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _studentData['password'] = value as String;
                          },
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor)),
                    onPressed: () {
                      _submit();
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
