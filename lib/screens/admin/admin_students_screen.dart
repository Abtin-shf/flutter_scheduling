import 'package:flutter/material.dart';
import 'package:last_war/widgets/admin/dialogs/admin_students_dialog.dart';

class AdminStudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size.fromWidth(250),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).accentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  content: AdminStudentsDialog('Computer Engineering'),
                ),
              );
            },
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text('Computer Engineering'),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size.fromWidth(250),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).accentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  content: AdminStudentsDialog('Electrical Engineering'),
                ),
              );
            },
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text('Electrical Engineering'),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size.fromWidth(250),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).accentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  content: AdminStudentsDialog('BioMedical Engineering'),
                ),
              );
            },
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text('BioMedical Engineering'),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
