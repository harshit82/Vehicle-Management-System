import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_parking_management/home.dart';
import 'package:vehicle_parking_management/views/enter_parking_space_details.dart';
import 'package:vehicle_parking_management/views/generate_receipt.dart';
import 'package:vehicle_parking_management/views/history.dart';

// list of all available cameras
//late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //_cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Vehicle Parking Management Application',
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
            ),
            initialRoute: "/enter_parking_details",
            routes: {
              "/enter_parking_details": (context) =>
                  const EnterParkingSpaceDetails(),
              "/generate_receipt": (context) => const Receipt(),
              "/history": (context) => const HistoryScreen(),
              "/receipt": (context) => const Receipt(),
            },
            home: const Home(),
          );
        });
  }
}
