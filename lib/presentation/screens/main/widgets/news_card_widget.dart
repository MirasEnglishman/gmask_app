import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class NewsCardWidget extends StatefulWidget {
  final String? url;
  const NewsCardWidget({this.url, super.key});

  @override
  State<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap:(){
               Routes.router.navigate(
                            Routes.storySlider,
                            navigationType: NavigationType.push,
                          );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0), // отступ изображения от бордеров
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  fit: BoxFit.cover,
                  
                  widget.url ??
                      '',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
