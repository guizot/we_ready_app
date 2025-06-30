import 'package:equatable/equatable.dart';
import '../../../../data/models/local/invitation_model.dart';

abstract class InvitationCubitState extends Equatable {
  const InvitationCubitState();

  @override
  List<Object?> get props => [];
}

class InvitationInitial extends InvitationCubitState {}

class InvitationLoading extends InvitationCubitState {}

class InvitationLoaded extends InvitationCubitState {
  final List<Invitation> invitations;
  const InvitationLoaded({required this.invitations});

  @override
  List<Object?> get props => [invitations];
}

class InvitationEmpty extends InvitationCubitState {}

class InvitationError extends InvitationCubitState {
  final String message;
  const InvitationError({required this.message});

  @override
  List<Object?> get props => [message];
}