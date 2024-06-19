// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationInformation extends StatefulWidget {
//   const LocationInformation({super.key});
//
//   @override
//   State<LocationInformation> createState() => _LocationInformationState();
// }
//
// class _LocationInformationState extends State<LocationInformation> {
//   getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       log("Location Denied ");
//       LocationPermission ask = await Geolocator.requestPermission();
//     } else {
//       Position currentposition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.bestForNavigation);
//       log("Latitude=${currentposition.latitude.toString()}");
//       log("longitude=${currentposition.longitude.toString()}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         getCurrentLocation();
//       },
//       child: const Text("abc"),
//     );
//   }
// }
//
// // import 'dart:async';
// // import 'dart:developer';
//
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
//
// // class LocationInformation extends StatefulWidget {
// //   const LocationInformation({Key? key}) : super(key: key);
//
// //   @override
// //   State<LocationInformation> createState() => _LocationInformationState();
// // }
//
// // class _LocationInformationState extends State<LocationInformation> {
// //   late Position _currentPosition;
//
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadSavedLocation();
// //     _startLocationUpdates();
// //   }
//
// //   _loadSavedLocation() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     double? savedLatitude = prefs.getDouble('latitude');
// //     double? savedLongitude = prefs.getDouble('longitude');
// //     double? saveTimestamp = prefs.getDouble('timestamp');
// //     double? saveaccuracy = prefs.getDouble('accuracy');
// //     double? saveTimestamp = prefs.getDouble('timestamp');
// //     double? saveTimestamp = prefs.getDouble('timestamp');
// //     double? saveTimestamp = prefs.getDouble('timestamp');
//
// //     if (savedLatitude != null &&
// //         savedLongitude != null &&
// //         saveTimestamp != null) {
// //       setState(() {
// //         _currentPosition = Position(
// //             latitude: savedLatitude,
// //             longitude: savedLongitude,
// //             timestamp: saveTimestamp,
// //             accuracy: saveaccuracy,
// //             altitude: null,
// //             altitudeAccuracy: null,
// //             heading: null,
// //             headingAccuracy: null,
// //             speed: null,
// //             speedAccuracy: null);
// //       });
// //     }
// //   }
//
// //   _startLocationUpdates() async {
// //     LocationPermission permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied ||
// //         permission == LocationPermission.deniedForever) {
// //       // Handle denied permission
// //       return;
// //     }
//
// //     Geolocator.getPositionStream(
// //             desiredAccuracy: LocationAccuracy.bestForNavigation)
// //         .listen((Position position) {
// //       _updateLocation(position);
// //     });
// //   }
//
// //   _updateLocation(Position position) async {
// //     setState(() {
// //       _currentPosition = position;
// //     });
//
// //     // Save the current location to SharedPreferences
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     prefs.setDouble('latitude', position.latitude);
// //     prefs.setDouble('longitude', position.longitude);
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return ElevatedButton(
// //       onPressed: () {
// //         _getCurrentLocation();
// //       },
// //       child: const Text("Get Location"),
// //     );
// //   }
// // }
