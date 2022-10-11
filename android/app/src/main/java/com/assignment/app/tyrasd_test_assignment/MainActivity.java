package com.assignment.app.tyrasd_test_assignment;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.assignment.app.tyrasd_test_assignment/stepper";

    StepsController stepsController = new StepsController();

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getStepsData")) {
                                result.success(stepsController.getSteps());
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }
}
