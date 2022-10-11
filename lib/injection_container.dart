import 'package:get_it/get_it.dart';
import 'package:tyrasd_test_assignment/core/utils/toast_helper.dart';
import 'package:tyrasd_test_assignment/features/stepper/presentation/bloc/stepper_bloc.dart';

import 'features/stepper/data/data_sources/stepper_local_data_source.dart';
import 'features/stepper/data/repositories/stepper_repository_impl.dart';
import 'features/stepper/domain/repositories/stepper_repository.dart';
import 'features/stepper/domain/usecases/get_stepper_content_from_native.dart';


  final GetIt getIt = GetIt.instance;

  Future<void> registerDependencies() async {
    // Bloc
    getIt.registerFactory<StepperBloc>(() => StepperBloc(getIt()));

    // Use cases
    getIt.registerFactory(() => GetStepperContentFromNativeUseCase(getIt()));

    // Repository
    getIt.registerFactory<StepperRepository>(() => StepperRepositoryImpl(stepperLocalDataSource: getIt()));

    // Data sources
    getIt.registerFactory<StepperLocalDataSource>(() => StepperLocalDataSource());

    //core
    getIt.registerLazySingleton(() => ToastHelper());

  }

