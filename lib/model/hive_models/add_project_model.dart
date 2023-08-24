import 'dart:io';

import 'package:hive/hive.dart';

part 'add_project_model.g.dart';

@HiveType(typeId: 0)
class AddProjectModel extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? cost;

  @HiveField(4)
  String? duration;

  @HiveField(5)
  String? population;

  @HiveField(6)
  String? detail;

  @HiveField(7)
  String? budget;

  @HiveField(8)
  String? image;

  @HiveField(9)
  String? assets;

  AddProjectModel({
    required this.latitude,
    required this.longitude,
      this.name,
      this.cost,
      this.budget,
      this.detail,
      this.duration,
      this.population,
      this.image,
      this.assets
  });
}
