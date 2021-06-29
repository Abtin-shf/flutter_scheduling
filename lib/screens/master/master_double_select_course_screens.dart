import 'package:flutter/material.dart';
import 'package:last_war/providers/master/master_timetable_provider.dart';
import 'package:last_war/widgets/master/master_select_courses_dateandtime_item.dart';
import 'package:provider/provider.dart';

class MasterSelectCourseDateAndTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final extractedTimeTableData =
        Provider
            .of<MasterTimeTableProvider>(context)
            .getMasterTimeTableData;
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 5),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 6 / 7,
              children: extractedTimeTableData.map((tableData) {
                print(tableData);
                return MasterSelectCoursesDateAndTimeItem(
                  classNumber: tableData['classNumber'] as String,
                  course: tableData['course'] as String,
                  day: tableData['day'] as String,
                  bell: tableData['bell'] as String,
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme
                            .of(context)
                            .accentColor)),
                onPressed: () {},
                child: Text('Edit'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme
                            .of(context)
                            .accentColor)),
                onPressed: () {},
                child: Text('Done'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MasterSelectCourseCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder:, itemCount:,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme
                            .of(context)
                            .accentColor)),
                onPressed: () {},
                child: Text('Edit'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme
                            .of(context)
                            .accentColor)),
                onPressed: () {},
                child: Text('Done'),
              )
            ],
          )
        ],
      ),
    );
  }
}
