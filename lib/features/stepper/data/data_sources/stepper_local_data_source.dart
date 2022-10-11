import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/stepper_model.dart';

class StepperLocalDataSource {
  static const platform = MethodChannel('com.assignment.app.tyrasd_test_assignment/stepper');

  Future<List<StepperModel>> getStepperDataFromAndroidChannel() async {
    List<StepperModel> steps = [];
    try {
      final result = await platform.invokeMethod('getStepsData');
      steps = List<StepperModel>.from(
          jsonDecode(result).map((element) => StepperModel.fromJson(element)));
      return steps;
    } catch (e) {
      throw const FormatException("Failed to get data");
    }
  }
}
