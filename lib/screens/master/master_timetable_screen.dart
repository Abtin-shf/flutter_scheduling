import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/master/master_timetable_provider.dart';
import 'package:last_war/widgets/master/master_timetable_item.dart';
import 'package:provider/provider.dart';

class MasterTimeTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final extractedTimeTableData =
        Provider.of<MasterTimeTableProvider>(context).getMasterTimeTableData;
    return GridView.count(
      crossAxisCount: 4,
      // mainAxisSpacing: 1,
      // crossAxisSpacing: 1,
      childAspectRatio: 5 / 7,
      children: extractedTimeTableData
          .map(
            (tableData) {
              print(tableData);
             return MasterTimeTableItem(
                classNumber: tableData['classNumber'] as String,
                course: tableData['course'] as String,
                day: tableData['day'] as String,
                bell: tableData['bell'] as String,
              );
            }
          )
          .toList(),
    );
  }
}
