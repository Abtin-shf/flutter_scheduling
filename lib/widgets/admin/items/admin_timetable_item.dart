import 'package:flutter/material.dart';
import 'package:last_war/widgets/admin/dialogs/admin_timetable_dialog.dart';

class AdminTimeTableItem extends StatelessWidget {
  final String day;
  final String bell;
  final List<Map<String, String>> items;

  AdminTimeTableItem({
    required this.day,
    required this.bell,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Theme.of(context).primaryColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Text(bell),
              //fit:BoxFit.fitWidth
            ),
            Icon(Icons.arrow_drop_down_sharp),
            Center(
              child: Center(
                child: FittedBox(
                  child: Text(
                    day,
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
              day: day,
              bell: bell,
              items: items,
            ),
          ),
        );
      },
    );
  }
}
