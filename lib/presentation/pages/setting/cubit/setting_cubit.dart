import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/pages/setting/cubit/setting_state.dart';
import '../../../../data/datasource/shared/shared_preferences_data_source.dart';

class SettingCubit extends Cubit<SettingCubitState> {

  final SharedPreferenceDataSource sharedPreferenceDataSource;
  SettingCubit({required this.sharedPreferenceDataSource}) : super(SettingInitial());


}