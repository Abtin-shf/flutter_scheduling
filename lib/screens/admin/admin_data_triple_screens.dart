import 'package:flutter/material.dart';
import 'package:last_war/providers/admin/admin_data_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_data_edit_dialog.dart';
import 'package:last_war/widgets/admin/items/admin_data_item.dart';
import 'package:provider/provider.dart';

class _DataItem extends StatelessWidget {
  final List<String> items;

  _DataItem({required this.items});

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
            itemBuilder: (ctx, index) => AdminDataItem(item: items[index]),
            itemCount: items.length,
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
    final items = Provider.of<AdminDataProvider>(context).getDayItems;
    return _DataItem(items: items);
  }
}

class AdminDataBellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<AdminDataProvider>(context).getBellItems;
    return _DataItem(items: items);
  }
}

class AdminDataCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<AdminDataProvider>(context).getCoursesItems;
    return _DataItem(items: items);
  }
}
