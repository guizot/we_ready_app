import 'package:equatable/equatable.dart';

import '../../../../data/models/local/rundown_model.dart';

abstract class RundownCubitState extends Equatable {
  const RundownCubitState();

  @override
  List<Object?> get props => [];
}

class RundownInitial extends RundownCubitState {}

class RundownLoading extends RundownCubitState {}

class RundownLoaded extends RundownCubitState {
  final List<Rundown> rundowns;
  const RundownLoaded({required this.rundowns});

  @override
  List<Object?> get props => [rundowns];
}

class RundownEmpty extends RundownCubitState {}

class RundownError extends RundownCubitState {
  final String message;
  const RundownError({required this.message});

  @override
  List<Object?> get props => [message];
}