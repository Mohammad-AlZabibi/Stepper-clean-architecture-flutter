import 'package:flutter/material.dart';

Step step({required String title, String? subtitle, required String description, required int index, required int currentStep}) {
  return Step(
    title: Text(title,style: TextStyle(color: currentStep == index ? Colors.black : null),),
    subtitle: Text(subtitle ?? ""),
    content: Column(
      children: <Widget>[
        Text(description)
      ],
    ),
    isActive: currentStep >= index,
    state: currentStep > index ? StepState.complete : StepState.disabled,
  );
}