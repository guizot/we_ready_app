import 'package:flutter/material.dart';
import '../../core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/header_item.dart';
import 'invitation_item.dart';
import 'invitation_summary.dart';

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
        children: [
          HeaderItem(
            name: "Jack & Gill",
            onAdd: () {
              Navigator.pushNamed(context, RoutesValues.invitationAdd);
            },
          ),
          const InvitationSummary(
            ceremonyName: "Acara Pernikahan"
          ),
          const InvitationItem(
            name: "Keluarga Bapak Indra",
            pax: 4,
            isConfirmed: true,
            icon: IconValues.familyManWomanGirlBoy,
            invitationType: "Groom's Family",
            iconType: IconValues.personInTuxedoLightSkinTone
          ),
          const InvitationItem(
            name: "Keluarga Bapak Jose",
            pax: 2,
            isConfirmed: false,
            icon: IconValues.familyManWomanBoy,
            invitationType: "Bride's Family",
            iconType: IconValues.womanWithVeilLightSkinTone
          ),
          const InvitationItem(
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