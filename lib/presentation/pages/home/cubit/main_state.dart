import 'package:equatable/equatable.dart';

abstract class MainCubitState extends Equatable {
  const MainCubitState();

  @override
  List<Object?> get props => [];
}

class MainInitial extends MainCubitState {}

class MainStateLoading extends MainCubitState {}

class MainStateLoaded extends MainCubitState {}

class MainStateEmpty extends MainCubitState {}

class MainStateError extends MainCubitState {
  final String message;
  const MainStateError({required this.message});

  @override
  List<Object?> get props => [message];
}