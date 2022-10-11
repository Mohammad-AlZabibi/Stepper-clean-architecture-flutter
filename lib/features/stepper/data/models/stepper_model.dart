import 'dart:convert';

import 'package:tyrasd_test_assignment/features/stepper/domain/entities/steps.dart';


class StepperModel extends Steps {
  StepperModel(
      {required String title, String? subtitle, required String description})
      : super(title: title, subtitle: subtitle, description: description);

  factory StepperModel.fromJson(Map<String, dynamic> json) {
    return StepperModel(
      title: json['title'],
      subtitle: json['subtitle'] == null ? null : json['subtitle']  ,
      description: json['description'],
    );
  }
}
