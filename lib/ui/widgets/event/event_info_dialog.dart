import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/providers/event_provider.dart';
import 'package:volunteering_kemsu/ui/shared_widgets/indicator.dart';

class EventInfoDialog extends ConsumerWidget {
  const EventInfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventInfo = ref.watch(eventProvider.select(
      (state) => state.eventInfo,
    ));

    final token = ref.watch(userInfoProvider.select((state) => state.token));

    return eventInfo.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(
        child: Text('Ошибка: $err'),
      ),
      data: (event) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(15.0),
                      topLeft: const Radius.circular(15.0),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment(0.95, 1),
                      colors: <Color>[
                        Color.fromARGB(200, 25, 96, 184),
                        Color.fromARGB(169, 0, 101, 255),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${event.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                      // ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(187, 79, 187, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            "${event.date}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Image.network(
                        'http://192.168.1.34:8080/volunteeringKEMSU/api/images/storage?fileName=${event.image}',
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://shkola24syktyvkar.gosuslugi.ru/netcat_files/203/3463/6660.jpg',
                            height: 220,
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
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(child: _container('Формат', event.format)),
                        const SizedBox(width: 10),
                        Expanded(child: _container('Тип', event.type)),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(child: _container('Возраст', "${event.age}+")),
                        const SizedBox(width: 10),
                        Expanded(
                          child:
                              _container('Награда', "${event.points} баллов"),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: _container('Адрес', "${event.address}"),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(30, 130, 187, 246),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(79, 25, 96, 184),
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Регистрация: ${event.countParticipants} из ${event.maxCountParticipants}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 11, 43, 81),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  event.maxCountParticipants != 0
                                      ? CustomPercentIndicator(
                                          formula:
                                              (event.countParticipants ?? 1.0)
                                                      .toDouble() /
                                                  (event.maxCountParticipants ??
                                                          1.0)
                                                      .toDouble(),
                                          textPercent:
                                              '${(event.countParticipants?.toDouble() ?? 1.0) / (event.maxCountParticipants?.toDouble() ?? 1.0) * 100}%',
                                        )
                                      : CustomPercentIndicator(
                                          formula: 1.0,
                                          textPercent:
                                              '${(event.countParticipants?.toDouble() ?? 1.0) * 100}%',
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(30, 130, 187, 246),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(79, 25, 96, 184),
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Описание",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(200, 25, 96, 184),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    event.description ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 11, 43, 81),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (token != 'BAD' && event.status == true)
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(eventProvider.notifier).signUp(),
                        child: Text("Зарегистрироваться"),
                      ),

                      Text(
                        event.message ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _container(String name, String? text) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(30, 130, 187, 246),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color.fromARGB(82, 25, 96, 184),
        width: 1.5,
      ),
    ),
    child: Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(200, 25, 96, 184),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text ?? '',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 11, 43, 81),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
