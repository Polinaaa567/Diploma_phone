import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:volunteering_kemsu/core/providers/auth_providers.dart';
import 'package:volunteering_kemsu/core/providers/education_providers.dart';
import 'package:volunteering_kemsu/entities/lesson/lesson.dart';

class LessonsCard extends ConsumerWidget {
  final Lesson lesson;
  final bool isWatched = true;

  const LessonsCard({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(authProvider.select(
      (state) => state.isAuthenticated,
    ));

    final List<Icon> icons = [
      Icon(
        Icons.chrome_reader_mode_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.event,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.event_available_rounded,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.emoji_food_beverage_rounded,
        size: 30,
        color: Colors.white,
      ),
    ];

    final randomIcon = icons[Random().nextInt(icons.length)];

    return GestureDetector(
      onTap: () async {
        try {
          final String rawLink = lesson.link ?? '';
          if (rawLink == '') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Ссылка недоступна")),
            );
            return;
          }

          final Uri uri = Uri.parse(rawLink);

          final launched = await launchUrl(
            uri,
            mode: LaunchMode.externalNonBrowserApplication,
          );

          if (launched && isAuth) {
            ref.read(lessonProvider.notifier)
              ..updateID(lesson.id)
              ..sendPoints();
          } else if (!launched) {
            _showErrorSnackBar(context);
          }
        } on PlatformException catch (e) {
          Logger().e("Ошибка запуска: ${e.message}");
          _showErrorSnackBar(context);
        } on Exception catch (e) {
          Logger().e("Общая ошибка: $e");
          _showErrorSnackBar(context);
        }
      },
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.indigo,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 0, 124, 185),
                        Color.fromARGB(254, 71, 179, 200),
                      ],
                    ),
                  ),
                  child: randomIcon,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              lesson.headline ?? 'Без названия',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          if (isAuth)
                            Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isWatched
                                      ? Color.fromARGB(50, 84, 179, 99)
                                      : Color.fromARGB(40, 253, 105, 9),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      isWatched
                                          ? Icon(
                                              size: 17,
                                              Icons.check_circle,
                                              color: Color.fromARGB(
                                                  255, 84, 179, 99),
                                            )
                                          : Icon(
                                              size: 17,
                                              Icons.hourglass_top,
                                              color: Color.fromARGB(
                                                  255, 253, 105, 9),
                                            ),
                                      SizedBox(width: 5),
                                      Text(
                                        isWatched
                                            ? 'Просмотрено'
                                            : 'Не просмотрено',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isWatched
                                              ? const Color.fromARGB(
                                                  255, 84, 179, 99)
                                              : const Color.fromARGB(
                                                  255, 253, 105, 9),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${lesson.description}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ),
                          // if (isAuth)
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                                Text(
                                  '${lesson.numberPoints} баллов',
                                  style: TextStyle(
                                    color: Color.fromARGB(150, 0, 0, 0),
                                  ),
                                )
                              ],
                            ),
                          ),
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
    );
  }

  void _showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Не удалось открыть ссылку")),
    );
  }
}
