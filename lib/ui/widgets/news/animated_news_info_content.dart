
import 'package:flutter/material.dart';
import 'package:volunteering_kemsu/core/models/news/news.dart';

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
