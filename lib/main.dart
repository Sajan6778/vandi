import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vandi/widgets/Training1.dart';
import 'package:vandi/widgets/audioplayer.dart';
import 'package:vandi/widgets/loginpage.dart';
import 'package:vandi/widgets/registrationpage.dart';
import 'package:vandi/widgets/savaaripage.dart';
import 'package:vandi/widgets/vehicledropdown.dart';
import 'package:vandi/widgets/workerdropdown.dart';
import 'package:vandi/widgets/minitempo.dart';
import 'package:vandi/widgets/training.dart';
import 'package:vandi/widgets/training1.dart';
import "package:vandi/firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Login1(),

        "register": (context) => Registration(),
        "savaari": (context) => Savaari(),
        "vehicle": (context) => Dropdown(),
        "workers": (context) => Workerdropdown(),
      },
    ),
  );


  

  
 
  
}
