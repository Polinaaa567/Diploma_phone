import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/providers/event_provider.dart';
import 'package:volunteering_kemsu/widgets/event/date_picker.dart';

class EventSearch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateStart = ref.watch(eventProvider.select(
      (state) => state.dateStart,
    ));

    final dateEnd = ref.watch(eventProvider.select(
      (state) => state.dateEnd,
    ));

    return Row(
      children: [
        Expanded(
          child: DatePicker(
            value: dateStart!,
            label: 'Начало',
            onChanged: (date) =>
                ref.read(eventProvider.notifier).updateDateStart(date),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: DatePicker(
            value: dateEnd!,
            label: 'Конец',
            onChanged: (date) =>
                ref.read(eventProvider.notifier).updateDateEnd(date),
          ),
        ),
        SizedBox(width: 10),
        if (dateStart != '' && dateEnd != '')
          IconButton(
            onPressed: () =>
                ref.read(eventProvider.notifier).fetchEventsBetweenDate(),
            icon: Icon(Icons.search),
          )
      ],
    );
  }
}
