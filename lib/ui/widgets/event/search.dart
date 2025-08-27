import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/providers/event_provider.dart';
import 'package:volunteering_kemsu/ui/widgets/event/date_picker.dart';

class EventSearch extends ConsumerWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateStart = ref.watch(eventProvider.select(
      (state) => state.dateStart,
    ));

    final dateEnd = ref.watch(eventProvider.select(
      (state) => state.dateEnd,
    ));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
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
          if (dateStart != '' && dateEnd != '')
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () =>
                    ref.read(eventProvider.notifier).fetchEventsBetweenDate(),
                icon: Icon(Icons.search),
              ),
            ),
        ],
      ),
    );
  }
}
