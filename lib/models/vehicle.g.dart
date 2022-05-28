// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      passengers: json['passengers'] as String,
      consumables: json['consumables'] as String,
      vehicle_class: json['vehicle_class'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'passengers': instance.passengers,
      'consumables': instance.consumables,
      'vehicle_class': instance.vehicle_class,
      'url': instance.url,
    };
