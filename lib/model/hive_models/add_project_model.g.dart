// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_project_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddProjectModelAdapter extends TypeAdapter<AddProjectModel> {
  @override
  final int typeId = 0;

  @override
  AddProjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddProjectModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      name: fields[2] as String?,
      cost: fields[3] as String?,
      budget: fields[7] as String?,
      detail: fields[6] as String?,
      duration: fields[4] as String?,
      population: fields[5] as String?,
      image: fields[8] as String?,
      assets: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddProjectModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.cost)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.population)
      ..writeByte(6)
      ..write(obj.detail)
      ..writeByte(7)
      ..write(obj.budget)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.assets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddProjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
