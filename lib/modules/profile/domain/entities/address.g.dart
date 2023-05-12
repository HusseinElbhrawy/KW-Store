// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 0;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      street: fields[0] as String,
      region: fields[1] as String,
      state: fields[2] as String,
      fullAddress: fields[3] as String,
      note: fields[4] as String,
      latitude: fields[5] as double,
      longitude: fields[6] as double,
      type: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.fullAddress)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(7)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
