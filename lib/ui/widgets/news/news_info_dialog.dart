import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:volunteering_kemsu/core/models/news/news.dart';

import 'package:volunteering_kemsu/core/providers/news_provider.dart';

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
                    'http://192.168.1.34:8080/volunteeringKEMSU/api/images/storage?fileName=${news.image}',
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

class AnimatedNewsContent extends StatefulWidget {
  final News news;

  const AnimatedNewsContent({
    super.key,
    required this.news,
  });

  @override
  State<StatefulWidget> createState() => _AnimatedNewsContentState();
}

class _AnimatedNewsContentState extends State<AnimatedNewsContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _progressAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.4,
          curve: Curves.easeOut,
        ),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.4,
          0.8,
          curve: Curves.easeOut,
        ),
      ),
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.news.headline}",
          style: TextStyle(
            color: const Color.fromARGB(250, 0, 15, 185),
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return LinearProgressIndicator(
              value: _progressAnimation.value,
              minHeight: 2,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(150, 0, 124, 185),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: child,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(150, 0, 124, 185),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "${widget.news.description?.replaceAll(r"\n", "\n\n")}",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
