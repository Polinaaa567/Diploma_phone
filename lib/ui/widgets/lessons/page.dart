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

    return Column(
      children: [
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
