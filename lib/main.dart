import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_attendance/core/di/locator.dart';
import 'package:geo_attendance/core/presentation/views/home/home_view.dart';
import 'package:geo_attendance/core/utils/text_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await setupLocator();
  Fimber.plantTree(DebugTree(useColors: true));
  // Fimber.plantTree(DebugTree.elapsed());

  runApp(const ProviderScope(
    child: GeoAttendance(),
  ));
}

class GeoAttendance extends StatelessWidget {
  const GeoAttendance({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Attendance',
      theme: ThemeData(
        textTheme: myTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomeView(title: 'No Name Yet'),
    );
  }
}
