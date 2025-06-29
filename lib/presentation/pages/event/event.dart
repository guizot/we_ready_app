import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../injector.dart';
import '../../core/constant/theme_service_values.dart';
import '../../core/service/theme_service.dart';
import '../../core/widget/common_item.dart';
import 'cubit/event_cubit.dart';
import 'event_switch.dart';
import '../invitation/invitation_summary.dart';
import '../rundown/rundown_summary.dart';
import '../vendor/vendor_summary.dart';

class EventPageProvider extends StatelessWidget {
  const EventPageProvider({super.key, this.pageKey});
  final Key? pageKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EventCubit>(),
      child: EventPage(key: pageKey),
    );
  }
}

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => EventPageState();
}

class EventPageState extends State<EventPage> {

  Map<String, dynamic>? summaryVendor;
  Map<String, dynamic>? summaryInvitation;
  Map<String, dynamic>? summaryRundown;

  @override
  void initState() {
    super.initState();
    getSummary();
  }

  void getSummary() {
    setState(() {
      summaryVendor = context.read<EventCubit>().getSummaryVendor();
      summaryInvitation = context.read<EventCubit>().getSummaryInvitation();
      summaryRundown = context.read<EventCubit>().getSummaryRundown();
    });
    debugPrint("summaryVendor: $summaryVendor");
    debugPrint("summaryInvitation: $summaryInvitation");
    debugPrint("summaryRundown: $summaryRundown");
  }

  void onSelectedEventChanged() {
    context.read<EventCubit>().getAllEvent();
    getSummary();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService> (
        builder: (context, ThemeService themeService, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              EventSwitch(onChanged: onSelectedEventChanged),
              VendorSummary(summary: summaryVendor),
              InvitationSummary(summary: summaryInvitation),
              RundownSummary(summary: summaryRundown),
              CommonItem(
                  title: "Theme Mode",
                  icon: Icons.dark_mode_rounded,
                  child: Wrap(
                      spacing: 10,
                      runSpacing: 0,
                      children: List.generate(ThemeServiceValues.themeString.length, (index) {
                        return FilterChip(
                          label: Text(ThemeServiceValues.themeString[index]),
                          backgroundColor: Theme.of(context).highlightColor,
                          selectedColor: Theme.of(context).colorScheme.inversePrimary,
                          onSelected: (bool value) {
                            themeService.themeMode = ThemeServiceValues.themeString[index];
                          },
                          selected: themeService.themeMode == ThemeServiceValues.themeString[index] ? true : false,
                          side: const BorderSide(
                              style: BorderStyle.none
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                        );
                      }
                      )
                  )
              ),
              // CommonItem(
              //     title: "Theme Color",
              //     icon: Icons.color_lens_rounded,
              //     child: Wrap(
              //         spacing: 10,
              //         runSpacing: 0,
              //         children: List.generate(ThemeServiceValues.colorValue.length, (index) {
              //             return GestureDetector(
              //               onTap: () {
              //                themeService.colorSeed = ThemeServiceValues.colorString[index];
              //               },
              //               child: Container(
              //                   height: 50,
              //                   width: 50,
              //                   decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.black.withOpacity(0.2)),
              //                     shape: BoxShape.circle,
              //                     color: ThemeServiceValues.colorValueList[index],
              //                   ),
              //                   child: themeService.colorSeed == ThemeServiceValues.colorString[index]
              //                       ? const Icon(
              //                           Icons.check,
              //                           color: Colors.black,
              //                         )
              //                       : null
              //               )
              //             );
              //           }
              //         )
              //     )
              // ),
            ],
          );
        }
    );
  }

}