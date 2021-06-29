import 'package:flutter/material.dart';

class AdminDataEditDialog extends StatefulWidget {
  final String name;


  AdminDataEditDialog({required this.name});

  @override
  _AdminDataEditDialogState createState() =>
      _AdminDataEditDialogState();
}

class _AdminDataEditDialogState extends State<AdminDataEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _dataData = {
    'name': '',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 160,
          width: 180,
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
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
                      _dataData['name'] = value as String;
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

  void _submit() {
    //TODO Submit
    Navigator.of(context).pop();
  }
}
