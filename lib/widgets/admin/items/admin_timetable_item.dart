import 'package:flutter/material.dart';
import 'package:last_war/providers/time_table_bells_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_timetable_dialog.dart';
import 'package:provider/provider.dart';

class AdminTimeTableItem extends StatelessWidget {
  final timeTable;

  AdminTimeTableItem({required this.timeTable});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> timeTableBell =
        Provider.of<TimeTableBellsProvider>(context)
            .getSingleTimeTableBell(timeTable['timeTableBellId']);
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Theme.of(context).primaryColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Text(timeTableBell['bell']['label']),
              //fit:BoxFit.fitWidth
            ),
            Icon(Icons.arrow_drop_down_sharp),
            Center(
              child: Center(
                child: FittedBox(
                  child: Text(
                    timeTableBell['day']['label'],
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            content: AdminTimeTableDialog(
              day: timeTableBell['day'],
              bell: timeTableBell['bell'],

            ),
          ),
        );
      },
    );
  }
}
