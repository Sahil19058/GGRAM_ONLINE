
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeatmapController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<String> views = ["Ward View", "Zone View", "Sector View"];

  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  late GoogleMapController mapController;
  Rx<LatLng> currentLatLng = const LatLng(28.6139, 77.2090).obs;

  /// This will hold the detected locality or sector name
  RxString currentSector = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }


  void changePage(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLatLng.value = LatLng(position.latitude, position.longitude);

    // Animate camera
    if (mapController != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(currentLatLng.value),
      );
    }

    // Fetch sector/locality name
    await _getSectorFromLatLng(currentLatLng.value);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation(); // Re-check location when map is ready
  }

  Future<void> _getSectorFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Depending on the address, you can try:
        currentSector.value = place.subLocality ?? place.locality ?? place.name ?? "Unknown Location";

        print("Detected Sector/Area: ${currentSector.value}");
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }
}