import 'package:equatable/equatable.dart';
import 'package:we_ready_app/data/models/local/vendor_model.dart';

abstract class VendorCubitState extends Equatable {
  const VendorCubitState();

  @override
  List<Object?> get props => [];
}

class VendorInitial extends VendorCubitState {}

class VendorLoading extends VendorCubitState {}

class VendorLoaded extends VendorCubitState {
  final List<Vendor> vendors;
  const VendorLoaded({required this.vendors});

  @override
  List<Object?> get props => [vendors];
}

class VendorEmpty extends VendorCubitState {}

class VendorError extends VendorCubitState {
  final String message;
  const VendorError({required this.message});

  @override
  List<Object?> get props => [message];
}