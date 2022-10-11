import 'package:tyrasd_test_assignment/features/stepper/domain/entities/steps.dart';
import 'package:tyrasd_test_assignment/features/stepper/domain/repositories/stepper_repository.dart';

import '../data_sources/stepper_local_data_source.dart';

class StepperRepositoryImpl implements StepperRepository {
  StepperLocalDataSource stepperLocalDataSource ;


  StepperRepositoryImpl({required this.stepperLocalDataSource});

  @override
  Future<List<Steps>> getStepperContentFromNative() async {
    return await stepperLocalDataSource.getStepperDataFromAndroidChannel();
  }


}
