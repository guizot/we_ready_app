import 'package:flutter/material.dart';
import '../../core/constant/icon_values.dart';
import 'invitation_item.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});
  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          InvitationItem(
            name: "Keluarga Bapak Jose",
            pax: 2,
            isConfirmed: false,
            icon: IconValues.familyManWomanBoy,
            invitationType: "Bride's Family",
            iconType: IconValues.womanWithVeilLightSkinTone
          ),
          InvitationItem(
            name: "Peter Parker",
            pax: 2,
            isConfirmed: true,
            icon: IconValues.womanAndManHoldingHandsMediumLightSkinTone,
            invitationType: "Friends",
            iconType: IconValues.raisingHandsLightSkinTone
          ),
        ],
    );
  }

}