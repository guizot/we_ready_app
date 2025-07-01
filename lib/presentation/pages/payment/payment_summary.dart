import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../../data/models/local/payment_model.dart';
import '../../../data/models/local/vendor_model.dart';
import '../../core/widget/common_separator.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({super.key, required this.item, required this.payments });
  final Vendor? item;
  final List<Payment> payments;

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {

  @override
  Widget build(BuildContext context) {

    int totalBudget = int.tryParse(widget.item?.budget ?? '0') ?? 0;

    int totalPaid = widget.payments.fold<int>(0, (sum, item) {
      return sum + (int.tryParse(item.amount) ?? 0);
    });

    int totalUnpaid = totalBudget - totalPaid;

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(24.0)
            ),
            color: Theme.of(context).hoverColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   IconValues.partyPopper,
                    //   height: 18,
                    //   width: 18,
                    // ),
                    const Icon(
                      Icons.arrow_circle_right,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        widget.item?.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0)
                  ],
                ),
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.moneyBag,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.price_change_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Price"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text("Rp ${int.parse(widget.item!.budget).toCurrencyFormat()}")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.pageFacingUp,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.list_alt_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                      "Type"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.item?.category ?? '')
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.checkMarkButton,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Paid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text("Rp ${totalPaid.toCurrencyFormat()}")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.crossMark,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Unpaid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text("Rp ${totalUnpaid.toCurrencyFormat()}")
                ],
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    );
  }

}