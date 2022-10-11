import 'package:flutter/material.dart';

import 'features/stepper/presentation/pages/stepper_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Stepper test assignment', home: StepperPage(),debugShowCheckedModeBanner: false,);
  }
}

