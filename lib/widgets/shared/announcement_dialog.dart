import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/admin/admin_annoucement_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_announcements_timetable_picker_dialog.dart';
import 'package:provider/provider.dart';

class AnnouncementDialog extends StatefulWidget {
  static Map<String,dynamic> timeTable={};
  final String title;
  final String dateTime;
  final String description;
  final EditOrAdd editOrAdd;
  final String timeTableId;

  AnnouncementDialog(
      {required this.title,
      required this.dateTime,
      required this.description,
      required this.editOrAdd,
      required this.timeTableId});

  @override
  _AnnouncementDialogState createState() => _AnnouncementDialogState();
}

class _AnnouncementDialogState extends State<AnnouncementDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime? _selectedDate;
  bool _isTimeTableChosen = false;
  String dropdownValue = 'One';

  Map<String, String> _announcementData = {
    'title': '',
    'description': '',
  };

  void _showNotSupported(ctx){
    showDialog(
      context: ctx,
      builder: (ct) => CupertinoAlertDialog(
        content: Text('Editing Announcements Are Not Supported!'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay')),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final announcementData = Provider.of<AdminAnnouncementProvider>(context);
    if (widget.editOrAdd == EditOrAdd.Add) {
      announcementData.addAnnouncement(
          _announcementData['title'] as String,
          _announcementData['description'] as String,
          _selectedDate as String,
          AnnouncementDialog.timeTable['id']);
    }
    if (widget.editOrAdd == EditOrAdd.Edit) {
     _showNotSupported(context);
    }
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    AnnouncementDialog.timeTable={};
    _isTimeTableChosen = widget.editOrAdd == EditOrAdd.Edit ? true : false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 420,
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
                          ? widget.dateTime == ''
                              ? 'No Date Chosen Yet!'
                              : '${DateFormat.yMd().format(DateTime.parse(widget.dateTime))}'
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
                  Row(
                    children: [
                      _isTimeTableChosen
                          ? Text('${AnnouncementDialog.timeTable['course']['title']}')
                          : Text('No TimeTable Chosen!'),
                      TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                content: AdminAnnouncementTimeTablePickerDialog(),
                              ),
                            );
                          }, child: Text('Choose TimeTable')),
                    ],
                  ),
                  SizedBox(height: 20),
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
