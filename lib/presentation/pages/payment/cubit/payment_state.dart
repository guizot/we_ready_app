import 'package:equatable/equatable.dart';
import '../../../../data/models/local/payment_model.dart';

abstract class PaymentCubitState extends Equatable {
  const PaymentCubitState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentCubitState {}

class PaymentLoading extends PaymentCubitState {}

class PaymentLoaded extends PaymentCubitState {
  final List<Payment> payments;
  const PaymentLoaded({required this.payments});

  @override
  List<Object?> get props => [payments];
}

class PaymentEmpty extends PaymentCubitState {}

class PaymentError extends PaymentCubitState {
  final String message;
  const PaymentError({required this.message});

  @override
  List<Object?> get props => [message];
}