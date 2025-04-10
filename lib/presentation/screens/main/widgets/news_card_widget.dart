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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                  widget.url ??
                      'https://s3-alpha-sig.figma.com/img/3f61/e268/2bb61cd564bd31a698d9b862bf13383e?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=XZ-xAntKupLxoaC-F1o0f6Rto5WYOfp~zX4V8urS2bOBlyy02tWAxsvFUOrO9VzMQfEdRGdcmkvHP-e3ygz-jG~ypTiKu3yDFqj59DYz0gOxXcbwwUuKLSoLfUVTdE6CwWd3Um4moKoMAm3Q5Q-qhTMAxkpKzcnd8tB-l51JtZjBPDmx-rVxf2oEY4y5y~am-f0ALPM7sp2kOIzIIlx1PJxKL3X9HoPLFpIG2kMOsow9lqIC9JWV~NEDf3Z9IrBs44YTBgvN5JSYLueI0hqp0pbsrWrA8m3pWDbc0gDvtq4uk0IWLAfCYsDnzOkQTleIkc64NwEl6PtZ7Is16aOOIw__',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
