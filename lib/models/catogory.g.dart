// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class catagorymodelAdapter extends TypeAdapter<catagorymodel> {
  @override
  final int typeId = 1;

  @override
  catagorymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return catagorymodel(
      id: fields[0] as String,
      name: fields[1] as String,
      isdeleted: fields[2] as bool,
      type: fields[3] as catagorytype,
    );
  }

  @override
  void write(BinaryWriter writer, catagorymodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isdeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is catagorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class catagorytypeAdapter extends TypeAdapter<catagorytype> {
  @override
  final int typeId = 2;

  @override
  catagorytype read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return catagorytype.income;
      case 1:
        return catagorytype.expense;
      default:
        return catagorytype.income;
    }
  }

  @override
  void write(BinaryWriter writer, catagorytype obj) {
    switch (obj) {
      case catagorytype.income:
        writer.writeByte(0);
        break;
      case catagorytype.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is catagorytypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
