import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/providers/event_provider.dart';
import 'package:volunteering_kemsu/widgets/event/event_card.dart';
import 'package:volunteering_kemsu/widgets/event/search.dart';

class EventScreen extends ConsumerWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventList = ref.watch(eventProvider.select(
      (state) => state.eventList,
    ));

    final isLoadingMore = ref.watch(eventProvider.select(
      (state) => state.isLoadingMore,
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(84, 222, 248, 251),
      body: eventList.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('Ошибка: $err'),
        ),
        data: (pagination) {
          final events = pagination.events ?? [];
          final total = pagination.total ?? 0;
          final hasMore = pagination.hasMore ?? false;

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.8) {
                if (hasMore && !isLoadingMore) {
                  ref.read(eventProvider.notifier).fetchAllEvents();
                }
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => ref.read(eventProvider.notifier).refresh(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.blue,
                              Colors.lightBlueAccent
                            ],
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Волонтёрские мероприятия: $total",
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    EventSearch(),
                    events.isEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 100.0, bottom: 15),
                                child: Text("Нет доступных мероприятий"),
                              ),
                              ElevatedButton(
                                onPressed: () => ref.read(eventProvider.notifier).refresh(),
                                child: const Text('Обновить'),
                              ),
                            ],
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            separatorBuilder: (context, index) => SizedBox(height: 17,),
                            itemCount: events.length,
                            itemBuilder: (context, index) => EventCard(
                              event: events[index],
                            ),
                          ),
                    if (isLoadingMore)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
