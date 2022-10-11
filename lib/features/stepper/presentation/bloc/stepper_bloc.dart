import 'package:rxdart/rxdart.dart';
import 'package:tyrasd_test_assignment/core/utils/toast_helper.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/steps.dart';
import '../../domain/usecases/get_stepper_content_from_native.dart';

class StepperBloc{

  GetStepperContentFromNativeUseCase getStepperContentFromNative;

  StepperBloc(this.getStepperContentFromNative){
    _getStepperData();
  }


  final BehaviorSubject<List<Steps>> _stepsListController = BehaviorSubject.seeded([]);

  setStepsList(List<Steps> steps) => _stepsListController.sink.add(steps);

  ValueStream<List<Steps>> get stepsStream => _stepsListController.stream;

  _getStepperData() async {
    try{
      List<Steps> steps = await getStepperContentFromNative.call() ;
      setStepsList(steps);
    } on FormatException catch(e){
      getIt<ToastHelper>().showToast(e.message);
    } on Exception catch(e){
      getIt<ToastHelper>().showToast(e.toString());
    }
  }


  final BehaviorSubject<int> _currentStepIndexController = BehaviorSubject.seeded(0);

  setCurrentStepIndex(stepIndex) => _currentStepIndexController.sink.add(stepIndex);

  ValueStream<int> get currentStepIndexStream => _currentStepIndexController.stream;

  continued() {
    _currentStepIndexController.value < 2 ?  setCurrentStepIndex(_currentStepIndexController.value += 1) : null;
  }

  back() {
    _currentStepIndexController.value > 0 ? setCurrentStepIndex(_currentStepIndexController.value -= 1) : null;
  }

  dispose(){
    _currentStepIndexController.close();
  }

}