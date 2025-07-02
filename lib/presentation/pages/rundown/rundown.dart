import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/pages/rundown/rundown_item.dart';

import '../../../data/models/local/rundown_model.dart';
import '../../../injector.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/empty_state.dart';
import '../../core/widget/loading_state.dart';
import 'cubit/rundown_cubit.dart';
import 'cubit/rundown_state.dart';

class RundownPageProvider extends StatelessWidget {
  const RundownPageProvider({super.key, this.pageKey});
  final Key? pageKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RundownCubit>(),
      child: RundownPage(key: pageKey),
    );
  }
}

class RundownPage extends StatefulWidget {
  const RundownPage({super.key});
  @override
  State<RundownPage> createState() => RundownPageState();
}

class RundownPageState extends State<RundownPage> {

  @override
  void initState() {
    super.initState();
    context.read<RundownCubit>().getAllRundown();
  }

  void refreshData() {
    context.read<RundownCubit>().getAllRundown();
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

  void navigateRundownAdd() {
    Navigator.pushNamed(context, RoutesValues.rundownAdd).then((value) => refreshData());
  }

  void navigateRundownEdit(String id) {
    Navigator.pushNamed(context, RoutesValues.rundownAdd, arguments: id).then((value) => refreshData());
  }

  Widget rundownLoaded(List<Rundown> rundowns) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: rundowns.length,
      itemBuilder: (context, index) {
        final item = rundowns[index];
        return RundownItem(
          item: item,
          onTap: navigateRundownEdit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RundownCubit, RundownCubitState>(
      builder: (context, state) {
        if (state is RundownInitial) {
          return const SizedBox.shrink();
        } else if (state is RundownLoading) {
          return const LoadingState();
        } else if (state is RundownEmpty) {
          return EmptyState(
            title: "No Records",
            subtitle: "You haven’t added any rundown. Once you do, they’ll appear here.",
            tapText: "Add Rundown +",
            onTap: navigateRundownAdd,
            onLearn: showDataWarning,
          );
        } else if (state is RundownLoaded) {
          return rundownLoaded(state.rundowns);
        }
        return const SizedBox.shrink();
      },
    );
  }

}