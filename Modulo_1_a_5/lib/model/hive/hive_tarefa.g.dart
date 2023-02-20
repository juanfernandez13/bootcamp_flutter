// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_tarefa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTarefaAdapter extends TypeAdapter<HiveTarefa> {
  @override
  final int typeId = 1;

  @override
  HiveTarefa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTarefa()
      ..descricao = fields[0] as String
      ..concluido = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveTarefa obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descricao)
      ..writeByte(1)
      ..write(obj.concluido);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTarefaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
