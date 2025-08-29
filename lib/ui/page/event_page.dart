import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:volunteering_kemsu/core/providers/event_provider.dart';
import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/ui/widgets/event/event_card.dart';
import 'package:volunteering_kemsu/ui/widgets/event/search.dart';

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

    final isAuth = ref.watch(userInfoProvider.select(
      (state) => state.isAuthenticated,
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
                        padding: EdgeInsets.symmetric(vertical: 10),
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
                        child: Column(
                          children: [
                            Text(
                              "Волонтёрские мероприятия: $total",
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (isAuth)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                         ref.read(eventProvider.notifier)
                                          ..refreshPage()
                                          ..fetchAllEvents();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(FontAwesomeIcons.rectangleList),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Все мероприятия'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                         ref.read(eventProvider.notifier)
                                          ..refreshPage()
                                          ..fetchPastEventsUser();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                              FontAwesomeIcons.clockRotateLeft),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Мои прошедшие'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                         ref.read(eventProvider.notifier)
                                          ..refreshPage()
                                          ..fetchFutureEventsUser();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(FontAwesomeIcons.clock),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Мои предстоящие'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    EventSearch(),
                    events.isEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 100.0, bottom: 15),
                                child: Text("Нет доступных мероприятий"),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    ref.read(eventProvider.notifier).refresh(),
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
                            separatorBuilder: (context, index) => SizedBox(
                              height: 17,
                            ),
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
