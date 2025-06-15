import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../injector.dart';
import '../../core/constant/theme_service_values.dart';
import '../../core/service/theme_service.dart';
import '../../core/widget/common_item.dart';
import '../ceremony/ceremony_switch.dart';
import '../invitation/invitation_summary.dart';
import '../rundown/rundown_summary.dart';
import '../vendor/vendor_summary.dart';
import 'cubit/summary_cubit.dart';

class SummaryWrapperProvider extends StatelessWidget {
  const SummaryWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SummaryCubit>(),
      child: const SummaryPage(),
    );
  }
}

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});
  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService> (
        builder: (context, ThemeService themeService, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // HeaderItem(
              //   name: "Jack & Gill",
              //   onAdd: () {
              //     Navigator.pushNamed(context, RoutesValues.vendorAdd);
              //   },
              // ),
              const CeremonySwitch(
                  ceremonyName: "Acara Pernikahan"
              ),
              const VendorSummary(
                  name: "Vendor Summary"
              ),
              const InvitationSummary(
                  name: "Invitation Summary"
              ),
              const RundownSummary(
                  name: "Rundown Summary"
              ),
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