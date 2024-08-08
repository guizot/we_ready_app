import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../injector.dart';
import '../../core/constant/theme_service_values.dart';
import '../../core/service/theme_service.dart';
import '../../core/widget/common_item.dart';
import 'cubit/setting_cubit.dart';

class SettingWrapperProvider extends StatelessWidget {
  const SettingWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingCubit>(),
      child: const SettingPage(),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService> (
        builder: (context, ThemeService themeService, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              CommonItem(
                  title: "Theme Mode",
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
              CommonItem(
                  title: "Theme Color",
                  child: Wrap(
                      spacing: 10,
                      runSpacing: 0,
                      children: List.generate(ThemeServiceValues.colorValue.length, (index) {
                          return GestureDetector(
                            onTap: () {
                             themeService.colorSeed = ThemeServiceValues.colorString[index];
                            },
                            child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                                  shape: BoxShape.circle,
                                  color: ThemeServiceValues.colorValue[index],
                                ),
                                child: themeService.colorSeed == ThemeServiceValues.colorString[index]
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.black,
                                      )
                                    : null
                            )
                          );
                        }
                      )
                  )
              ),
            ],
          );
        }
    );
  }

}