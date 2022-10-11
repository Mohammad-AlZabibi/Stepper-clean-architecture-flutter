import '../../../../core/usecases/usecase.dart';
import '../entities/steps.dart';
import '../repositories/stepper_repository.dart';

class GetStepperContentFromNativeUseCase extends UseCase<List<Steps>> {
  final StepperRepository repository;

  GetStepperContentFromNativeUseCase(this.repository);


  @override
  Future<List<Steps>> call() {
    return Future(() => repository.getStepperContentFromNative());
  }
}
