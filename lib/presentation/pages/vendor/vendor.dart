import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/data/models/local/vendor_model.dart';
import '../../../injector.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/empty_state.dart';
import '../../core/widget/loading_state.dart';
import 'cubit/vendor_cubit.dart';
import 'cubit/vendor_state.dart';
import 'vendor_item.dart';

class VendorPageProvider extends StatelessWidget {
  const VendorPageProvider({super.key, this.pageKey});
  final Key? pageKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VendorCubit>(),
      child: VendorPage(key: pageKey),
    );
  }
}

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});
  @override
  State<VendorPage> createState() => VendorPageState();
}

class VendorPageState extends State<VendorPage> {

  @override
  void initState() {
    super.initState();
    context.read<VendorCubit>().getAllVendor();
  }

  void refreshData() {
    context.read<VendorCubit>().getAllVendor();
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

  void navigateVendorAdd() {
    Navigator.pushNamed(context, RoutesValues.vendorAdd).then((value) => refreshData());
  }

  void navigateVendorEdit(String id) {
    Navigator.pushNamed(context, RoutesValues.vendorAdd, arguments: id).then((value) => refreshData());
  }

  Widget vendorLoaded(List<Vendor> vendors) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: vendors.length,
      itemBuilder: (context, index) {
        final item = vendors[index];
        return VendorItem(
          item: item,
          onTap: navigateVendorEdit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorCubitState>(
      builder: (context, state) {
        if (state is VendorInitial) {
          return const SizedBox.shrink();
        } else if (state is VendorLoading) {
          return const LoadingState();
        } else if (state is VendorEmpty) {
          return EmptyState(
            title: "No Records",
            subtitle: "You haven’t added any vendors. Once you do, they’ll appear here.",
            tapText: "Add Vendor +",
            onTap: navigateVendorAdd,
            onLearn: showDataWarning,
          );
        } else if (state is VendorLoaded) {
          return vendorLoaded(state.vendors);
        }
        return const SizedBox.shrink();
      },
    );
  }

}