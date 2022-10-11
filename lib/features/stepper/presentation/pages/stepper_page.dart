import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/steps.dart';
import '../bloc/stepper_bloc.dart';
import '../widgets/step.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage>  {

  StepperBloc  stepperBloc = getIt<StepperBloc>();

  @override
  void dispose() {
   stepperBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: StreamBuilder<List<Steps>>(
        stream: stepperBloc.stepsStream,
        initialData: const [],
        builder: (context, stepsSnapshot) {
          if(stepsSnapshot.data != null && stepsSnapshot.data!.isNotEmpty){
            return Column(
              children: [
                stepper(steps:stepsSnapshot.data!)
              ],
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }

        }
      ),
    );
  }

  PreferredSizeWidget appBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Stepper test assignment'),
    );
  }

  Widget stepper({required List<Steps> steps}){
    return  Expanded(
    child: StreamBuilder<int>(
        stream: stepperBloc.currentStepIndexStream,
        initialData: 0,
        builder: (context, currentStepIndex) {
          return Stepper(
            type: StepperType.vertical,
            physics: const ScrollPhysics(),
            currentStep: currentStepIndex.data!,
            steps: [
              for (int i = 0; i < steps.length; i++)
                step(title: steps[i].title, subtitle: steps[i].subtitle, description: steps[i].description, index: i,currentStep: currentStepIndex.data!),
            ],
            controlsBuilder: (BuildContext context, ControlsDetails? control) {
              return Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: stepperBloc.continued,
                    child:  Text(currentStepIndex.data != 2 ? 'CONTINUE' :'FINISH'),

                  ),
                  TextButton(
                    onPressed: stepperBloc.back,
                    child:  Text('BACK',style: TextStyle(color: currentStepIndex.data != 0 ? null : Colors.grey.withOpacity(0.5)),),
                  ),
                ],
              );
            },
          );
        }
    ),
  );
  }



}
