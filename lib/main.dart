import 'package:flutter/material.dart';
import 'package:last_war/providers/admin/admin_annoucement_provider.dart';
import 'package:last_war/providers/admin/admin_data_provider.dart';
import 'package:last_war/providers/admin/admin_students_provider.dart';
import 'package:last_war/providers/admin/admin_timetable_provider.dart';
import 'package:last_war/providers/admin/all_courses_provider.dart';
import 'package:last_war/providers/master/master_announcement_provider.dart';
import 'package:last_war/providers/master/master_courses_provider.dart';
import 'package:last_war/providers/master/master_timetable_provider.dart';
import 'package:last_war/screens/admin/admin_tabs_screen.dart';
import 'package:last_war/screens/auth_screen.dart';
import 'package:last_war/screens/master/master_tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) => AdminAnnouncementProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AdminTimeTableProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AdminStudentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AdminDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MasterAnnouncementProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MasterTimeTableProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AllCoursesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MasterCoursesProvider(),
        ),


      ],
      child: MaterialApp(
        title: 'Last War',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightBlueAccent,
            textTheme: ButtonTextTheme.primary,
          ),
          textButtonTheme: TextButtonThemeData(

          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style:ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding:
              EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              primary: Theme.of(context).primaryColor,

            ),

          ),

        ),
        home: AuthScreen(),
        routes: {
          AdminTabsScreen.routName : (ctx) => AdminTabsScreen(),
          MasterTabsScreen.routName : (ctx) => MasterTabsScreen(),

        },
      ),
    );
  }
}

