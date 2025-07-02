import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/local/invitation_model.dart';
import '../../../injector.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/empty_state.dart';
import '../../core/widget/loading_state.dart';
import 'cubit/invitation_cubit.dart';
import 'cubit/invitation_state.dart';
import 'invitation_item.dart';

class InvitationPageProvider extends StatelessWidget {
  const InvitationPageProvider({super.key, this.pageKey});
  final Key? pageKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InvitationCubit>(),
      child: InvitationPage(key: pageKey),
    );
  }
}

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});
  @override
  State<InvitationPage> createState() => InvitationPageState();
}

class InvitationPageState extends State<InvitationPage> {

  @override
  void initState() {
    super.initState();
    context.read<InvitationCubit>().getAllInvitation();
  }

  void refreshData() {
    context.read<InvitationCubit>().getAllInvitation();
    setState(() {});
  }

  void showDataWarning() {
    DialogHandler.showConfirmDialog(
      context: context,
      title: "Data Protection",
      description: "All data is stored locally on your device. Uninstalling or clearing the app will permanently delete it. Be sure to back up anything important.",
      confirmText: "I Understand",
      onConfirm: () => Navigator.pop(context),
      isCancelable: false
    );
  }

  void navigateInvitationAdd() {
    Navigator.pushNamed(context, RoutesValues.invitationAdd).then((value) => refreshData());
  }

  void navigateInvitationEdit(String id) {
    Navigator.pushNamed(context, RoutesValues.invitationAdd, arguments: id).then((value) => refreshData());
  }

  Widget invitationLoaded(List<Invitation> invitations) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: invitations.length,
      itemBuilder: (context, index) {
        final item = invitations[index];
        return InvitationItem(
          item: item,
          onTap: navigateInvitationEdit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitationCubit, InvitationCubitState>(
      builder: (context, state) {
        if (state is InvitationInitial) {
          return const SizedBox.shrink();
        } else if (state is InvitationLoading) {
          return const LoadingState();
        } else if (state is InvitationEmpty) {
          return EmptyState(
            title: "No Records",
            subtitle: "You haven’t added any invitation. Once you do, they’ll appear here.",
            tapText: "Add Invitation +",
            onTap: navigateInvitationAdd,
            onLearn: showDataWarning,
          );
        } else if (state is InvitationLoaded) {
          return invitationLoaded(state.invitations);
        }
        return const SizedBox.shrink();
      },
    );
  }

}