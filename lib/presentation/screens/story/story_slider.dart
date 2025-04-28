import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gmask_app/core/app_colors.dart';

class StandaloneStoriesSlider extends StatefulWidget {
  const StandaloneStoriesSlider({Key? key}) : super(key: key);

  @override
  State<StandaloneStoriesSlider> createState() =>
      _StandaloneStoriesSliderState();
}

class _StandaloneStoriesSliderState extends State<StandaloneStoriesSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  // Built-in sample stories data
  final List<Map<String, dynamic>> _stories = [
    {
      'title': 'ВОССТАНОВЛЕНИЕ ХРОМА',
      'description':
          'Получился блеск! Мы вернём заводской лоск элементам хрома — без замены и лишних затрат.',
      'buttonText': 'Перейти по ссылке',
      'backgroundColor': const Color(0xFF212121),
      'assetImage':
          'assets/images/story1.jpg',
      'onTap': () {
        // Handle story tap for first item
        print('Story 1 tapped');
      },
    },
    {
      'title': 'ВОССТАНОВЛЕНИЕ ХРОМА',
      'description':
          'Получился блеск! Мы вернём заводской лоск элементам хрома — без замены и лишних затрат.',
      'buttonText': 'Перейти по ссылке',
      'backgroundColor': const Color(0xFF212121),
      'assetImage':
          'assets/images/story2.jpg',
      'onTap': () {
        // Handle story tap for second item
        print('Story 2 tapped');
      },
    },
    {
      'title': 'БРОНИРОВАНИЕ ФАР',
      'description':
          'Защити оптику от сколов, царапин и выгорания. Плёнка — как броня: сохраняет вид, продлевает срок службы и делает фары ярче.',
      'buttonText': 'Перейти по ссылке',
      'backgroundColor': const Color(0xFF212121),
      'assetImage':
          'assets/images/story3.png',
      'onTap': () {
        // Handle story tap for third item
        print('Story 3 tapped');
      },
    },
  ];

  // You can easily modify or replace this method to customize your storie
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Column(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height:
                  MediaQuery.of(context).size.height * 0.9, // Default height
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: _stories.length > 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _stories.map((story) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: story['onTap'],
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: story['backgroundColor'] ?? Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background image
                            Image.asset(
                              story['assetImage'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback if image is missing
                                return Container(
                                  color:
                                      story['backgroundColor'] ?? Colors.black,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.white, size: 50),
                                  ),
                                );
                              },
                            ),
                            // Gradient overlay for text readability
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  stops: const [0.5, 1.0],
                                ),
                              ),
                            ),
                            // Content
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    story['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    story['description'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),

                            // Close button
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                  onPressed: () {
                                   Navigator.pop(context);
                                    print('Close button pressed');
                                  },
                                ),
                              ),
                            ),
                
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          // Pagination indicators

          _buildActionButton('Перйти по ссылке'),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 70),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
