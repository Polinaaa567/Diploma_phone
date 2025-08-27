import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/models/lesson/lesson.dart';
import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/providers/lessons_provider.dart';
import 'package:volunteering_kemsu/ui/shared_widgets/indicator.dart';
import 'package:volunteering_kemsu/ui/widgets/lessons/card.dart';

class LessonsAllWidget extends ConsumerWidget {
  final List<Lesson> lessons;

  const LessonsAllWidget({
    super.key,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuth = ref.watch(userInfoProvider.select(
      (state) => state.isAuthenticated,
    ));

    final isAllLessons = ref.watch(lessonProvider.select(
      (state) => state.isAllLessons,
    ));

    final isPassedLessons = ref.watch(lessonProvider.select(
      (state) => state.isPassedLessons,
    ));

    final isNotPassedLessons = ref.watch(lessonProvider.select(
      (state) => state.isNotPassedLessons,
    ));

    final total = ref.watch(lessonProvider.select(
      (state) => state.total,
    ));

    return Column(
      children: [
        if (isAuth)
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.5, 1),
                      colors: <Color>[
                        Color.fromARGB(255, 67, 207, 234),
                        Color.fromARGB(255, 0, 124, 185),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.emoji_events,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Ваш прогресс обучения',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${0 / (total ?? 0) * 100}% завершено',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: CustomPercentIndicator(
                          formula: 0 / (total ?? 0),
                          textPercent: '${0 / (total ?? 0) * 100}%',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -0.5,
                  right: 0,
                  child: Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(15),
                      ),
                      color: Color.fromARGB(40, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (isAuth)
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () => {
                        if (!isAllLessons)
                          {
                            ref.read(lessonProvider.notifier)
                              ..statePage()
                              ..isAllLessons()
                              ..fetchAllLessons(),
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isAllLessons
                            ? Color.fromARGB(255, 44, 172, 236)
                            : Color.fromARGB(255, 234, 243, 243),
                      ),
                      child: Text(
                        'Все уроки',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isAllLessons
                              ? Colors.white
                              : Color.fromARGB(252, 74, 151, 193),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () => {
                        if (!isPassedLessons)
                          ref.read(lessonProvider.notifier)
                            ..statePage()
                            ..isPassedLessons()
                            ..fetchAllLessons(),
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isPassedLessons
                            ? Color.fromARGB(255, 44, 172, 236)
                            : Color.fromARGB(255, 234, 243, 243),
                      ),
                      child: Text(
                        'Пройденные',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isPassedLessons
                              ? Colors.white
                              : Color.fromARGB(252, 74, 151, 193),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () => {
                        if (!isNotPassedLessons)
                          ref.read(lessonProvider.notifier)
                            ..statePage()
                            ..isNotPassedLessons()
                            ..fetchAllLessons(),
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isNotPassedLessons
                            ? Color.fromARGB(255, 44, 172, 236)
                            : Color.fromARGB(255, 234, 243, 243),
                      ),
                      child: Text(
                        'Непройденные',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isNotPassedLessons
                              ? Colors.white
                              : Color.fromARGB(252, 74, 151, 193),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 17),
            itemCount: lessons.length,
            itemBuilder: (context, index) => LessonsCard(
              lesson: lessons[index],
            ),
          ),
        ),
      ],
    );
  }
}
