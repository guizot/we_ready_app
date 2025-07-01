import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/local/invitation_model.dart';
import '../../../../domain/usecases/invitation_usecases.dart';
import 'invitation_state.dart';

class InvitationCubit extends Cubit<InvitationCubitState> {

  final InvitationUseCases invitationUseCases;
  InvitationCubit({required this.invitationUseCases}) : super(InvitationInitial());

  Future<void> getAllInvitation() async {
    emit(InvitationLoading());
    List<Invitation> invitations = invitationUseCases.getAllInvitation();
    if(invitations.isEmpty) {
      emit(InvitationEmpty());
    } else if(invitations.isNotEmpty) {
      emit(InvitationLoaded(invitations: invitations));
    }
  }

  Invitation? getInvitation(String id) {
    emit(InvitationLoading());
    Invitation? event = invitationUseCases.getInvitation(id);
    emit(InvitationInitial());
    return event;
  }

  Future<void> saveInvitation(Invitation item) async {
    await invitationUseCases.saveInvitation(item);
  }

  Future<void> deleteInvitation(String id) async {
    await invitationUseCases.deleteInvitation(id);
  }

  String? getSelectedEventId() {
    try {
      return invitationUseCases.getSelectedEvent()['id'];
    } catch(e) {
      return null;
    }
  }

}