// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart';
//
// getUserLocation() async {
//   LocationData? currentLocation;
//   String error;
//   Location location = Location();
//   try {
//     currentLocation = await location.getLocation();
//   } on PlatformException catch (e) {
//     if (e.code == 'PERMISSION_DENIED') {
//       error = 'please grant permission';
//       print(error);
//     }
//     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//       error = 'permission denied- please enable it from app settings';
//       print(error);
//     }
//     currentLocation = null;
//   }
//   final coordinates = Coordinates(
//       currentLocation.latitude, currentLocation.longitude);
//   var addresses =
//   await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
//   var first = addresses.first;
//   return first;
// }

// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart';
//
// getUserLocation() async {
//   LocationData? currentLocation;
//   String? error;
//   Location location = Location();
//   try {
//     currentLocation = await location.getLocation();
//   } on PlatformException catch (e) {
//     if (e.code == 'PERMISSION_DENIED') {
//       error = 'please grant permission';
//       print(error);
//     }
//     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//       error = 'permission denied- please enable it from app settings';
//       print(error);
//     }
//     currentLocation = null;
//   }
//   if (currentLocation != null) {
//     final coordinates = new Coordinates(
//         currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);
//     var addresses =
//     await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
//     var first = addresses.first;
//     return first;
//   } else {
//     return null; // Handle the case where currentLocation is null
//   }
// }

// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart' as loc;
//
// Future<String?> getUserLocation() async {
//   loc.LocationData? currentLocation;
//   String? error;
//   loc.Location location = loc.Location();
//   try {
//     currentLocation = await location.getLocation();
//   } on loc.PermissionDeniedException catch (e) {
//     print('Location permission denied: $e');
//     return 'Permission denied';
//   } on loc.ServiceDisabledException catch (e) {
//     print('Location service disabled: $e');
//     return 'Service disabled';
//   } on PlatformException catch (e) {
//     print('Error getting location: $e');
//     return 'Error';
//   }
//
//   if (currentLocation != null) {
//     final coordinates = new Coordinates(
//         currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);
//     List<Placemark> addresses =
//     await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
//     Placemark first = addresses.first;
//     return first.street.toString() + ', ' + first.locality.toString() + ', ' + first.country.toString();
//   } else {
//     return null; // Handle the case where currentLocation is null
//   }
// }
// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart' as loc;
// class Coordinates {
//   final double latitude;
//   final double longitude;
//
//   Coordinates(this.latitude, this.longitude);
// }
//
// Future<String?> getUserLocation() async {
//   loc.LocationData? currentLocation;
//   String? error;
//   loc.Location location = loc.Location();
//   try {
//     currentLocation = await location.getLocation();
//   } on PlatformException catch (e) {
//     if (e.code == 'PERMISSION_DENIED') {
//       error = 'Permission denied';
//       print(error);
//     } else if (e.code == 'SERVICE_STATUS_DISABLED') {
//       error = 'Location service disabled';
//       print(error);
//     } else {
//       error = 'Error getting location: $e';
//       print(error);
//     }
//     return error;
//   }
//
//   if (currentLocation != null) {
//     final coordinates = new Coordinates(
//         currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);
//     List<Placemark> addresses =
//     await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
//     Placemark first = addresses.first;
//     return first.street.toString() + ', ' + first.locality.toString() + ', ' + first.country.toString();
//   } else {
//     return null; // Handle the case where currentLocation is null
//   }
// }
