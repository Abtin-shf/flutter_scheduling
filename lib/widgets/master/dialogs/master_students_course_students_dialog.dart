import 'package:flutter/material.dart';
class MasterStudentsCourseStudentsDialog extends StatelessWidget {
  final Map<String, dynamic> course;


  MasterStudentsCourseStudentsDialog({required this.course});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 560,
          width: 350,
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              Text('${course['name']} Course Students List'),
              Divider(
                thickness: 4.0,
                color: Theme.of(context).accentColor,
                endIndent: 50,
                indent: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 490,
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
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                //TODO students Images
                                  'https://i.ibb.co/ftmK4D5/cfae1f642850da600d18a38b55013a18.jpg'),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('${course['students'][index]['name']}',style: TextStyle(
                              fontSize: 12
                            ),),
                            SizedBox(
                              width: 2,
                            ),
                            Text('${course['students'][index]['code']}',style: TextStyle(
                                fontSize: 12
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: course['students'].length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
