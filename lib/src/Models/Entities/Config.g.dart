// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigAdapter extends TypeAdapter<Config> {
  @override
  final int typeId = 1;

  @override
  Config read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Config(
      fields[0] as String,
      fields[1] as int,
      fields[4] as DateTime,
      fields[5] as DateTime?,
      fields[3] as String,
      fields[2] as int,
      fields[7] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Config obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.clientID)
      ..writeByte(2)
      ..write(obj.storageID)
      ..writeByte(3)
      ..write(obj.apiname)
      ..writeByte(4)
      ..write(obj.until)
      ..writeByte(5)
      ..write(obj.dayopened)
      ..writeByte(6)
      ..write(obj.ClientName)
      ..writeByte(7)
      ..write(obj.TenantName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
