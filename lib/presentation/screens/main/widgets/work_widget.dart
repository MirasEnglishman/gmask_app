import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class WorkWidget extends StatelessWidget {
  const WorkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Пример списка данных для карточек
    final works = [
      WorkItem(
        title: 'Полировка',
        description: 'Была произведена полировка кузова Mercedes Benz...',
        cost: 'от 100 000тг',
        imageUrl:'assets/images/work1.jpg'
      ),
      WorkItem(
        title: 'Оклейка в антигравийную пленку',
        description: 'Полная защита от сколов, царапин и внешних возде...',
        cost: 'от 20 000тг',
        imageUrl:'assets/images/work3.png'
      ),
      WorkItem(
        title: 'До и после: Химчистка салона',
        description: 'Результат говорит сам за себя - салон как новый...',
        cost: 'от 30 000тг',
        imageUrl:'assets/images/work2.jpg'

      ),
      WorkItem(
        title: 'Без следа от вмятин',
        description: 'Вернем кузовы форму и идеальный вид...',
        cost: 'от 40 000тг',
        imageUrl:'assets/images/work4.png'

      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: works.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 8), // расстояние между карточками
      itemBuilder: (context, index) {
        final work = works[index];
        return GestureDetector(
              onTap: () {
                        if (ModalRoute.of(context)?.settings.name ==
                            Routes.workDetailScreen) {
                        Routes.router.navigate(
                            Routes.workDetailScreen,
                            navigationType: NavigationType.pushReplace,
                          );
                        } else {
                          Routes.router.navigate(
                            Routes.workDetailScreen,
                            navigationType: NavigationType.push,
                          );
                        }
                      },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Левая часть: изображение или иконка
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8), // скругление изображения
                  child: Image.asset(
                    width: 140,
                    height: 100,
                
                        work.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
          
                const SizedBox(width: 16),
                // Правая часть: текстовое описание работы
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        work.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        work.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        work.cost,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Модель данных для карточек работ
class WorkItem {
  final String title;
  final String description;
  final String cost;
  final String imageUrl;

  WorkItem({
    required this.title,
    required this.description,
    required this.cost,
    required this.imageUrl
  });
}
