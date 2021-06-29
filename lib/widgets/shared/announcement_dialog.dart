import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementDialog extends StatefulWidget {
final String title;
final String dateTime;
final String description;


AnnouncementDialog({required this.title, required this.dateTime, required this.description});

  @override
  _AnnouncementDialogState createState() =>
      _AnnouncementDialogState();
}

class _AnnouncementDialogState extends State<AnnouncementDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime? _selectedDate;
  String dropdownValue = 'One';

  Map<String, String> _announcementData = {
    'title': '',
    'description': '',
    'date': '',
    'course': '',
  };

  Future<void> _submit() async {
    //TODO submit
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    print('${widget.title} TITLEEEEEEE');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 370,
          width: 300,
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
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Title!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _announcementData['title'] = value as String;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(_selectedDate == null
                          ? widget.dateTime==''?'No Date Chosen Yet!':'${DateFormat.yMd().format(DateTime.parse(widget.dateTime))}'
                          : 'Picked Date:${DateFormat.yMd().format(_selectedDate!)}'),
                      TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: widget.description,
                    maxLines: 4,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      labelText: 'Description',
                    ),
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Description!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _announcementData['description'] = value as String;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
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

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
