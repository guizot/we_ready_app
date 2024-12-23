import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import 'package:we_ready_app/presentation/pages/rundown/rundown_item.dart';

class RundownPage extends StatefulWidget {
  const RundownPage({super.key});
  @override
  State<RundownPage> createState() => _RundownPageState();
}

class _RundownPageState extends State<RundownPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          RundownItem(
            time: "09:00",
            timeAmount: "1 Jam 30 Menit",
            icon: IconValues.megaphone,
            title: "Sungkeman Keluarga Groom",
            subtitle: "Proses sungkeman dengan keluarga groom di ruangan Alila",
          ),
          RundownItem(
            time: "10:15",
            timeAmount: "30 Menit",
            icon: IconValues.megaphone,
            title: "Tea Pai",
            subtitle: "Proses Tea Pai di dengan kedua keluarga di ruangan Seminyak",
          ),
        ],
    );
  }

}