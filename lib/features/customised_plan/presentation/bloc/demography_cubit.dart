import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';

part 'demography_state.dart';

class DemographyCubit extends Cubit<DemographyState> {
  DemographyCubit({required this.getDemographyStepByIdUseCase}) : super(DemographyInitial());

  final GetDemographyStepById getDemographyStepByIdUseCase ;
}
