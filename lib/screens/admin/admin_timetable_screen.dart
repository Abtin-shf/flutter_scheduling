import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/admin/admin_timetable_provider.dart';
import 'package:last_war/widgets/admin/items/admin_timetable_item.dart';
import 'package:provider/provider.dart';

class AdminTimeTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final extractedTimeTableData =
        Provider.of<AdminTimeTableProvider>(context).getItems;
    return GridView.count(
      crossAxisCount: 4,
      // mainAxisSpacing: 1,
      // crossAxisSpacing: 1,
      childAspectRatio: 5 / 7,
      children: extractedTimeTableData
          .map(
            (tableData) => AdminTimeTableItem(
              day: tableData['day'],
              bell: tableData['bell'],
              items: tableData['items'] ,
            ),
          )
          .toList(),
    );
  }
}
