
import '../entities/steps.dart';

abstract class StepperRepository {
  Future<List<Steps>> getStepperContentFromNative();
}
