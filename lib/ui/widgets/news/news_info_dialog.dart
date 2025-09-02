import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import 'package:volunteering_kemsu/config/ip.dart';
import 'package:volunteering_kemsu/core/providers/news_provider.dart';
import 'package:volunteering_kemsu/ui/widgets/news/animated_news_info_content.dart';

class NewsInfoDialog extends ConsumerWidget {
  const NewsInfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsInfo = ref.watch(newsProvider.select(
      (state) => state.newsInfo,
    ));

    return newsInfo.when(
      error: (err, stack) => Center(
        child: Text('Ошибка: $err'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (news) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 67, 207, 234),
                        Color.fromARGB(255, 0, 124, 185),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(vertical: 10) ,child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.newspaper,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Новости',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => context.pop(),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Color.fromARGB(123, 255, 255, 255),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async => await Share.share(
                          "Прочитала новость: ${news.headline}. В приложении 'Волонтёрство. КемГУ'",
                          subject: 'Рекомендация приложения',
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Color.fromARGB(123, 255, 255, 255),
                        ),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),),
                if (news.image != null && news.image != '')
                  Image.network(
                    'http://$myIP/volunteeringKEMSU/api/images/storage?fileName=${news.image}',
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://sun9-13.userapi.com/impf/wp_ckCPuXV7M7xbC_g3lVtpc2BgQhYx-9ZmeMQ/yor2PcNjubE.jpg?size=1920x768&quality=95&crop=0,0,1920,767&sign=53350d02d37dada715aca1519472dffd&type=cover_group',
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 67, 207, 234),
                          Color.fromARGB(150, 0, 124, 185),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${news.dateCreation}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedNewsContent(news: news),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
