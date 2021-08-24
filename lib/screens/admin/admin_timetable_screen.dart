import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/time_tables_provider.dart';
import 'package:last_war/widgets/admin/items/admin_timetable_item.dart';
import 'package:provider/provider.dart';

class AdminTimeTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeTables =
        Provider.of<TimeTablesProvider>(context).getTimeTables(null, null, null);
    return GridView.count(
      crossAxisCount: 4,
      // mainAxisSpacing: 1,
      // crossAxisSpacing: 1,
      childAspectRatio: 5 / 7,
      children: timeTables
          .map(
            (timeTable) => AdminTimeTableItem(
              timeTable: timeTable,
            ),
          )
          .toList(),
    );
  }
}
