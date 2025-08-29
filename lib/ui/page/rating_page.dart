import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingList = ref.watch(userInfoProvider.select(
      (state) => state.usersRating,
    ));

    Logger().d(ratingList);

    final achievements = ref.watch(userInfoProvider.select(
      (state) => state.userProfile,
    ));

    int? placeInRating = ref.watch(userInfoProvider.select(
          (state) => state.placeInRating,
        )) ??
        0;

    if (placeInRating == 0) {
      placeInRating = placeInRating;
    } else {
      placeInRating = placeInRating + 1;
    }

    final nextLevel = ref.watch(userInfoProvider.select(
          (state) => state.userProfile?.level,
        ))! +
        1;

    return Scaffold(
      backgroundColor: Color.fromARGB(100, 222, 248, 251),
      body: SingleChildScrollView(
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
                    colors: <Color>[Colors.blue, Colors.lightBlueAccent],
                    tileMode: TileMode.mirror,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Мои достижения",
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        _achievementsCard(
                          Icons.signal_cellular_alt,
                          'Текущий уровень',
                          '${achievements?.level ?? 0}',
                          'Новичок-волонтёр',
                        ),
                        SizedBox(width: 10),
                        _achievementsCard(
                          Icons.star_rate_rounded,
                          'Всего баллов',
                          '${achievements?.points ?? 0}',
                          'За всё время',
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        _achievementsCard(
                          FontAwesomeIcons.medal,
                          'Место в рейтинге',
                          '${(placeInRating) ?? 0}',
                          '',
                        ),
                        SizedBox(width: 10),
                        _achievementsCard(
                          FontAwesomeIcons.award,
                          'Получено наград',
                          '${achievements?.certificates?.length ?? 0}',
                          'Из всех возможных',
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Прогресс до следующего уровня',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Уровень ${achievements?.level ?? 0}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 65, 92, 230),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Уровень $nextLevel',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(120, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: LinearPercentIndicator(
                              lineHeight: 20,
                              percent: achievements?.percent ?? 0,
                              backgroundColor: Color.fromARGB(50, 0, 0, 0),
                              progressColor: Colors.lightBlueAccent,
                              barRadius: Radius.circular(10),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${achievements?.points} баллов',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(120, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${achievements?.maxPoint} баллов',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(100, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 25,
                          decoration: BoxDecoration(color: Colors.blue),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          FontAwesomeIcons.certificate,
                          color: Colors.indigo,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Мои награды',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  achievements?.certificates == null ||
                          achievements!.certificates!.isEmpty
                      ? Text(
                          'Нет наград',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 10,
                            child: ImageSlideshow(
                              height: 310,
                              indicatorColor: Colors.blue,
                              children: achievements.certificates!
                                  .map((String fileName) {
                                return Image.network(
                                  'http://192.168.1.34:8080/volunteeringKEMSU/api/images/storage?fileName=$fileName',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 3,
                                height: 25,
                                decoration: BoxDecoration(color: Colors.blue),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                FontAwesomeIcons.chartLine,
                                size: 22,
                                color: Colors.indigo,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Рейтинг участников',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Text(
                                  '#',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Участник',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Баллы',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(100, 0, 0, 0),
                              ),
                            ),
                          ),
                          ratingList.when(
                            error: (err, stack) => Center(
                              child: Text('Ошибка: $err'),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            data: (ratingUser) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                itemCount: ratingUser.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: placeInRating == (index + 1) ? Colors.grey.shade400 : null
                                        ),
                                        child: Row(
                                          children: [
                                            (index + 1) <= 3
                                                ? CircleAvatar(
                                                    backgroundColor:
                                                        (index + 1) == 1
                                                            ? Colors
                                                                .yellow.shade500
                                                            : (index + 1) == 2
                                                                ? Colors.grey
                                                                    .shade400
                                                                : Colors.brown
                                                                    .shade400,
                                                    child: Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                : CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    child: Text(
                                                      '${getInitials(ratingUser[index].name ?? '')}${getInitials(ratingUser[index].lastName ?? '')}',
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    '${ratingUser[index].name} ${ratingUser[index].lastName}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          200, 0, 0, 0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              '${ratingUser[index].points}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    200, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(15, 0, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getInitials(String bankAccountName) => bankAccountName.isNotEmpty
      ? bankAccountName
          .trim()
          .split(RegExp(' +'))
          .map((s) => s[0])
          .take(2)
          .join()
      : '';

  Widget _achievementsCard(
    IconData icon,
    String title,
    String value,
    String comment,
  ) {
    return Expanded(
      child: Card(
        elevation: 5,
        // shadowColor: Colors.indigo,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.9, 0.3),
              colors: <Color>[
                Colors.blueAccent,
                Colors.blue,
                Colors.lightBlueAccent
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: Color.fromRGBO(52, 160, 234, 0.2),
                    ),
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 7),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    comment,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(180, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
