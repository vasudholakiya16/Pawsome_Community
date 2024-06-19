import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pass_app_ultron_techonology/firebase_options.dart';

import 'Splesh_screen/Splesh_Screen.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await _initializeFirebase();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pawsome Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

Future<void> _initializeFirebase() async {
  try {
    // Initialize Firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    debugPrint('Firebase initialized successfully.');

    // Create an instance of FlutterNotificationChannel
    final notificationChannel = FlutterNotificationChannel();

    // Register notification channel
    var result = await notificationChannel.registerNotificationChannel(
      description: 'For Showing Message Notification',
      id: 'chats',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Chats',
    );

    debugPrint('\nNotification Channel Result: $result');
  } catch (e) {
    // Handle any errors that occur during initialization or registration
    debugPrint('Error: $e');
  }
}
