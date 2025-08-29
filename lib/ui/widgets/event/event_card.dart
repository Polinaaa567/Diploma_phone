import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:volunteering_kemsu/core/models/event/event.dart';
import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/providers/event_provider.dart';

class EventCard extends ConsumerWidget {
  final Event event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(userInfoProvider.select(
      (state) => state.isAuthenticated,
    ));

    return GestureDetector(
      onTap: () => {
        context.push(
          '/events/${event.id}',
        ),
        ref.read(eventProvider.notifier)
          ..updateID(event.id)
          ..fetchEventInfo(),
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.indigo,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  'http://192.168.1.34:8080/volunteeringKEMSU/api/images/storage?fileName=${event.image}',
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://sun9-13.userapi.com/impf/wp_ckCPuXV7M7xbC_g3lVtpc2BgQhYx-9ZmeMQ/yor2PcNjubE.jpg?size=1920x768&quality=95&crop=0,0,1920,767&sign=53350d02d37dada715aca1519472dffd&type=cover_group',
                      // height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 220,
                      color: Colors.grey,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 4,
                color: Colors.lightBlueAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 197, 219, 248),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          event.date ?? 'Дата не указана',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.indigo,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.name ?? 'Без названия',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      event.description ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(132, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (isAuth && (event.isRelevance ?? true) && (event.stampParticipate ?? true))
                      Text(
                        'Идёт регистрация',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(252, 170, 5, 5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
