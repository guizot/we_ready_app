import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/rundown_model.dart';
import 'package:intl/intl.dart';

import '../../presentation/core/constant/initial_values.dart';

class RundownUseCases {

  final HiveRepo hiveRepo;
  RundownUseCases({required this.hiveRepo});

  List<Rundown> getAllRundown() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final allRundowns = hiveRepo.getAllRundown();
        final filteredRundowns = allRundowns
            .where((rundown) => rundown.eventId == eventId)
            .toList();
        final dateFormat = DateFormat('dd MMM yyyy - HH:mm');
        filteredRundowns.sort((a, b) {
          final aTime = dateFormat.parse(a.start);
          final bTime = dateFormat.parse(b.start);
          return aTime.compareTo(bTime);
        });
        return filteredRundowns;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Rundown? getRundown(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getRundown(id);
  }

  Future<void> saveRundown(Rundown item) async {
    await hiveRepo.saveRundown(item.id, item);
    final selected = getSelectedEvent();
    if (selected != null && selected is Map && selected['id'] != null) {
      await updateSummaryRundown(selected['id']);
    }
  }

  Future<void> deleteRundown(String id) async {
    await hiveRepo.deleteRundown(id);
    final selected = getSelectedEvent();
    if (selected != null && selected is Map && selected['id'] != null) {
      await updateSummaryRundown(selected['id']);
    }
  }

  Future<void> updateSummaryRundown(String eventId) async {
    final allRundowns = hiveRepo.getAllRundown();
    final rundowns = allRundowns.where((r) => r.eventId == eventId).toList();

    if (rundowns.isEmpty) {
      await saveSummaryRundown(eventId, InitialValues().rundownInit());
      return;
    }

    final dateFormat = DateFormat('dd MMM yyyy - HH:mm');
    final durations = <Duration>[];
    final startTimes = <DateTime>[];
    final endTimes = <DateTime>[];
    final uniqueDays = <String>{};

    DateTime dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

    for (final r in rundowns) {
      final start = dateFormat.parse(r.start);
      final end = dateFormat.parse(r.end);

      durations.add(end.difference(start));
      startTimes.add(start);
      endTimes.add(end);

      final startDate = dateOnly(start);
      final endDate = dateOnly(end);

      for (var date = startDate;
      !date.isAfter(endDate);
      date = date.add(const Duration(days: 1))) {
        uniqueDays.add(DateFormat('yyyy-MM-dd').format(date));
      }
    }

    final totalDuration = durations.fold(Duration.zero, (a, b) => a + b);
    final totalHours = totalDuration.inHours;
    final totalMinutes = totalDuration.inMinutes % 60;

    final firstStart = startTimes.reduce((a, b) => a.isBefore(b) ? a : b);
    final lastEnd = endTimes.reduce((a, b) => a.isAfter(b) ? a : b);

    final updatedSummary = {
      'sessions': '${rundowns.length} Session${rundowns.length == 1 ? '' : 's'}',
      'totalHours': '$totalHours Hr $totalMinutes Min',
      'totalDays': '${uniqueDays.length} Day${uniqueDays.length == 1 ? '' : 's'}',
      'startAt': dateFormat.format(firstStart),
      'endAt': dateFormat.format(lastEnd),
    };

    await saveSummaryRundown(eventId, updatedSummary);
  }

  Future<void> saveSummaryRundown(String eventId, Map<String, dynamic> summary) async {
    await hiveRepo.saveSetting('${HiveValues.summaryRundown}_$eventId', summary);
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}