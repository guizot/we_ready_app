import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/core/model/payment_args.dart';
import 'package:we_ready_app/presentation/pages/payment/payment_item.dart';
import '../../../data/models/local/payment_model.dart';
import '../../../injector.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/empty_state.dart';
import '../../core/widget/loading_state.dart';
import 'cubit/payment_state.dart';
import 'cubit/peyment_cubit.dart';
import 'payment_summary.dart';

class PaymentPageProvider extends StatelessWidget {
  const PaymentPageProvider({super.key, required this.vendorId});
  final String vendorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PaymentCubit>(),
      child: PaymentPage(vendorId: vendorId),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.vendorId});
  final String vendorId;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().getAllPayment(widget.vendorId);
  }

  void refreshData() {
    context.read<PaymentCubit>().getAllPayment(widget.vendorId);
    setState(() {});
  }

  void navigatePaymentAdd() {
    Navigator.pushNamed(
      context,
      RoutesValues.paymentAdd,
      arguments: PaymentArgs(
        vendorId: widget.vendorId
      )
    ).then((value) => refreshData());
  }

  void navigatePaymentEdit(String id) {
    Navigator.pushNamed(
        context,
        RoutesValues.paymentAdd,
        arguments: PaymentArgs(
          id: id,
          vendorId: widget.vendorId
        )
    ).then((value) => refreshData());
  }

  Widget paymentLoaded(List<Payment> payments) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: payments.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return PaymentSummary(
            item: context.read<PaymentCubit>().getVendor(widget.vendorId),
            payments: payments,
          );
        }
        final item = payments[index - 1];
        return PaymentItem(
          item: item,
          onTap: navigatePaymentEdit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              tooltip: 'Add',
              onPressed: navigatePaymentAdd,
            ),
          )
        ],
      ),
      body: BlocBuilder<PaymentCubit, PaymentCubitState>(
        builder: (context, state) {
          if (state is PaymentInitial) {
            return const SizedBox.shrink();
          } else if (state is PaymentLoading) {
            return const LoadingState();
          } else if (state is PaymentEmpty) {
            return EmptyState(
              title: "No Records",
              subtitle: "You haven’t added any payments. Once you do, they’ll appear here.",
              tapText: "Add Payment +",
              onTap: navigatePaymentAdd,
            );
          } else if (state is PaymentLoaded) {
            return paymentLoaded(state.payments);
          }
          return const SizedBox.shrink();
        },
      )
    );
  }

}