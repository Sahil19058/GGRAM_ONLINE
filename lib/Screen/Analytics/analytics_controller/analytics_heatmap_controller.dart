import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeatmapController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<String> views = ["Ward View", "Zone View", "Sector View"];

  RxBool isMapLoaded = false.obs;
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  late GoogleMapController mapController;

  Rx<LatLng> currentLatLng = const LatLng(28.6139, 77.2090).obs;
  RxString currentSector = ''.obs;

  final RxSet<Heatmap> heatmaps = <Heatmap>{}.obs;

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
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLatLng.value = LatLng(position.latitude, position.longitude);
    await _getSectorFromLatLng(currentLatLng.value);
    _addHeatmap(currentLatLng.value);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    isMapLoaded.value = true;
    _getCurrentLocation();
  }

  Future<void> _getSectorFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentSector.value =
            place.subLocality ?? place.locality ?? place.name ?? "Unknown";
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  void _addHeatmap(LatLng location) {
    final Set<Heatmap> temp = {};
    temp.add(
      Heatmap(
        heatmapId: HeatmapId(location.toString()),
        data: _createPoints(location),
        radius: const HeatmapRadius.fromPixels(20),
        gradient: const HeatmapGradient(
          [
            HeatmapGradientColor(Colors.green, 0.2),
            HeatmapGradientColor(Colors.red, 0.8),
          ],
        ),
      ),
    );
    heatmaps.clear();
    heatmaps.addAll(temp);
  }

  List<WeightedLatLng> _createPoints(LatLng location) {
    return [
      _createWeightedLatLng(location.latitude, location.longitude, 1),
      _createWeightedLatLng(location.latitude + 0.001, location.longitude + 0.001, 1),
      _createWeightedLatLng(location.latitude - 0.001, location.longitude - 0.001, 1),
    ];
  }

  WeightedLatLng _createWeightedLatLng(double lat, double lng, int intensity) {
    return WeightedLatLng(
      LatLng(lat, lng),
      weight: intensity.toDouble(),
    );
  }
}