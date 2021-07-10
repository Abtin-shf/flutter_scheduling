import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/admin/admin_students_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_students_edit_dialog.dart';
import 'package:provider/provider.dart';

class AdminStudentsDialog extends StatelessWidget {
  final String field;

  AdminStudentsDialog(this.field);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final extractedStudents =
        Provider.of<AdminStudentsProvider>(context).getItems;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height * 0.7, //tule kolle dialog
          width: 350,
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: mediaQuery.viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              Text('$field'),
              Divider(
                thickness: 4.0,
                color: Theme.of(context).accentColor,
                endIndent: 50,
                indent: 50,
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.01, //bala
              ),
              Container(
                height: mediaQuery.size.height * 0.525,  //payine dialog
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: ListTile(
                      title: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('${extractedStudents[index]['name']}'),
                            SizedBox(
                              width: 2,
                            ),
                            Text('${extractedStudents[index]['code']}'),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    content: AdminStudentsEditDialog(
                                        name: extractedStudents[index]['name']
                                        as String,
                                        code: extractedStudents[index]['code']
                                        as String),
                                  ),
                                );
                              },

                              iconSize: 22,
                            ),
                            IconButton(
                              onPressed: () {
                                //TODO DELETE STUDENT
                              },
                              icon: Icon(Icons.delete),
                              iconSize: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: extractedStudents.length,
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.035, //add
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(150),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      content: AdminStudentsEditDialog(name: '', code: ''),
                    ),
                  );
                },
                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text('Add'),
                      ),
                      Icon(
                        Icons.add,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
