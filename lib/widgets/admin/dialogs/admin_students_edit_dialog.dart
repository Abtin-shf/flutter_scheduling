import 'package:flutter/material.dart';

class AdminStudentsEditDialog extends StatefulWidget {
  final String name;
  final String code;

  AdminStudentsEditDialog({required this.name, required this.code});

  @override
  _AdminStudentsEditDialogState createState() =>
      _AdminStudentsEditDialogState();
}

class _AdminStudentsEditDialogState extends State<AdminStudentsEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _studentData = {
    'name': '',
    'code': '',
  };

  void _submit() {
    //TODO SUBMIT STUDENT
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 240,
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
                      labelText: 'Name',
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Name!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _studentData['name'] = value as String;
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
