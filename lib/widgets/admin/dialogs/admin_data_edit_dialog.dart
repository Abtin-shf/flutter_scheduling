import 'package:flutter/material.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/admin/admin_data_provider.dart';
import 'package:provider/provider.dart';

class AdminDataEditDialog extends StatefulWidget {
  final String name;
  final String secondOne;
  final DataType type;
  final EditOrAdd editOrAdd;
  final String id;

  AdminDataEditDialog(
      {required this.name,
      required this.secondOne,
      required this.type,
      required this.editOrAdd,
      required this.id});

  @override
  _AdminDataEditDialogState createState() => _AdminDataEditDialogState();
}

class _AdminDataEditDialogState extends State<AdminDataEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _dataData = {
    'name': '',
    'secondOne': '',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 250,
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
                    height: 20,
                  ),
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
    _formKey.currentState!.save();
    final data = Provider.of<AdminDataProvider>(context);
    if (widget.editOrAdd == EditOrAdd.Edit) {
      if (widget.type == DataType.Day) {
        data.editDay(widget.id, _dataData['name'] as String,
            _dataData['secondOne'] as String);
      }
      if (widget.type == DataType.Bell) {
        data.editBell(widget.id, _dataData['name'] as String,
            _dataData['secondOne'] as String);
      }
      if (widget.type == DataType.Course) {
        data.editCourse(widget.id, _dataData['name'] as String,
            _dataData['secondOne'] as String);
      }
    }
    if (widget.editOrAdd == EditOrAdd.Add) {
      if (widget.type == DataType.Day) {
        data.addDay(
            _dataData['name'] as String, _dataData['secondOne'] as String);
      }
      if (widget.type == DataType.Bell) {
        data.addBell(
            _dataData['name'] as String, _dataData['secondOne'] as String);
      }
      if (widget.type == DataType.Course) {
        data.addCourse(
            _dataData['name'] as String, _dataData['secondOne'] as String);
      }
    }
    Navigator.of(context).pop();
  }
}
