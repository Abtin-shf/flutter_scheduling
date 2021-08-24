import 'package:flutter/material.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/admin/admin_data_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_data_edit_dialog.dart';
import 'package:last_war/widgets/admin/items/admin_data_item.dart';
import 'package:provider/provider.dart';

class _DataItem extends StatelessWidget {
  final List<String> names;
  final DataType type;
  final List<String> secondOnes;
  final List<String> ids;

  _DataItem(
      {required this.names,
      required this.type,
      required this.secondOnes,
      required this.ids});

  @override
  Widget build(BuildContext context) {
    final mediaQuery= MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          //height: 448,
          height: mediaQuery.size.height * 0.55,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (ctx, index) => AdminDataItem(
              name: names[index],
              secondOne: secondOnes[index],
              type: type, id: ids[index],
            ),
            itemCount: names.length,
          ),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.05,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                content: AdminDataEditDialog(
                  name: '',
                  secondOne: '',
                  type: type,
                  editOrAdd: EditOrAdd.Add, id: '',
                ),
              ),
            );
          },
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              Size.fromWidth(150),
            ),
            backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
          ),
          child: Text(
            'Add',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height:  mediaQuery.size.height * 0.015,
        ),
        ElevatedButton(
          onPressed: () {
            //TODO Generate DATA
          },
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              Size.fromWidth(200),
            ),
            backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
          ),
          child: Text(
            'Generate',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}

class AdminDataDayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = Provider.of<AdminDataProvider>(context).getDays;
    List<String> labels = [];
    List<String> dayOfWeeks = [];
    List<String> ids = [];
    days.forEach((day) {
      labels.add(day['label']);
      dayOfWeeks.add(day['dayOfWeek']);
      ids.add(day['id']);
    });
    return _DataItem(
      names: labels,
      type: DataType.Day,
      secondOnes: dayOfWeeks,
      ids: ids,
    );
  }
}

class AdminDataBellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = Provider.of<AdminDataProvider>(context).getBells;
    List<String> labels = [];
    List<String> bellOfDays = [];
    List<String> ids = [];
    days.forEach((bell) {
      labels.add(bell['label']);
      bellOfDays.add(bell['bellOfDay']);
      ids.add(bell['id']);
    });
    return _DataItem(
      names: labels,
      type: DataType.Bell,
      secondOnes: bellOfDays,
      ids: ids,
    );
  }
}

class AdminDataCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = Provider.of<AdminDataProvider>(context).getCourses(null, null);
    List<String> titles = [];
    List<String> unitCounts = [];
    List<String> ids = [];
    days.forEach((course) {
      titles.add(course['title']);
      unitCounts.add(course['unitsCount']);
      ids.add(course['id']);
    });
    return _DataItem(
      names: titles,
      type: DataType.Course,
      secondOnes: unitCounts,
      ids: ids,
    );
  }
}
