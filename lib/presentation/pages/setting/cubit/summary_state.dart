import 'package:equatable/equatable.dart';

abstract class SummaryCubitState extends Equatable {
  const SummaryCubitState();

  @override
  List<Object?> get props => [];
}

class SummaryInitial extends SummaryCubitState {}

class SummaryStateLoading extends SummaryCubitState {}

class SummaryStateLoaded extends SummaryCubitState {}

class SummaryStateError extends SummaryCubitState {
  final String message;
  const SummaryStateError({required this.message});

  @override
  List<Object?> get props => [message];
}