import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  final String name;
  final String model;
  final String manufacturer;
  final String passengers;
  final String consumables;
  final String vehicle_class;

  Vehicle(
      {required this.name,
      required this.model,
      required this.manufacturer,
      required this.passengers,
      required this.consumables,
      required this.vehicle_class});

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
