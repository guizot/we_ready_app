import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/pages/setting/cubit/summary_state.dart';
import '../../../../data/datasource/shared/shared_preferences_data_source.dart';

class SummaryCubit extends Cubit<SummaryCubitState> {

  final SharedPreferenceDataSource sharedPreferenceDataSource;
  SummaryCubit({required this.sharedPreferenceDataSource}) : super(SummaryInitial());


}