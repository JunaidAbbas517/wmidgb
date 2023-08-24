import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wmidgb/boxes/boxes.dart';
import 'package:wmidgb/model/hive_models/add_project_model.dart';

class AddProjectViewModel extends ChangeNotifier {
  File? images;
  File? get image => images;
  Position? _position;
  Position? get position => _position;
  String? _address;
  String? get address => _address;
  // List<File> _imageList = [];
  // List<File> get imageList => _imageList;

  StreamSubscription<Position>? _positionStreamSubscription;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      images = File(image.path);
      // _imageList.add(_image!);
      notifyListeners();
    }
  }

  Future<void> requestLocationUpdates() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      final permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        // Handle permissions denied
        return;
      }
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permissionResult = await Geolocator.requestPermission();
      if (permissionResult != LocationPermission.whileInUse &&
          permissionResult != LocationPermission.always) {
        // Handle permissions denied
        return;
      }
    }

    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((Position position) async {
      _position = position;

      final addresses =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (addresses.isNotEmpty) {
        final address = addresses.first;
        _address = '${address.street}, ${address.locality}, ${address.country}';
        print(
            'Address: ${address.street}, ${address.locality}, ${address.country}');
        notifyListeners();
      }
    });
  }

  Future<void> saveProjectData(String name, String cost, String duration,
      String population, String detail, String budget, String assets) async {
    final data = AddProjectModel(
      latitude: position!.latitude,
      longitude: position!.longitude,
      name: name,
      cost: cost,
      budget: budget,
      detail: detail,
      duration: duration,
      population: population,
      assets: assets,
      image: images!.path,
    );
    final box = Boxes.getData();

    box.add(data);
    data.save();
  }

  void clearData() {
    _position = null;
    _address = null;
    images = null;

    notifyListeners();
  }

  void stopLocationUpdates() {
    _positionStreamSubscription?.cancel();
  }
}
