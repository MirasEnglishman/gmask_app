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
        cost: '~100 000тг',
      ),
      WorkItem(
        title: 'Работа 2',
        description: 'Описание работы 2',
        cost: '~2000',
      ),
      WorkItem(
        title: 'Работа 3',
        description: 'Описание работы 3',
        cost: '~3000',
      ),
      WorkItem(
        title: 'Работа 4',
        description: 'Описание работы 4',
        cost: '~4000',
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
                  child: CachedNetworkImage(
                    width: 140,
                    height: 100,
                    imageUrl:
                        "https://s3-alpha-sig.figma.com/img/8d45/9298/3833525d5ab247fffe948cbd170261f5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=iWqqN7sI82L8TknlpQs2BVXVaCueQMxfwDcJ5xWyx8jiAfoxHgbrHO2~sCmpnMAZWIQK8xtGIcy6zODdJqNhlRWUhVpsCm~hsYUdWreBxaCr12yAPwaRJpaqkL7muF2AwJ~kogiIJBOwKgozCiJQr-Uk~d5~vHN2r~qk11X9Hb1Cf756QZ~lHZQJHZ6XsWBmoDQVMWn8OlB-xJgShXDETtjCvGbisOXXEeyfQaQwiCO3fk-7Aiak9IMVAJLB7ubAqdap1rubYpi0iegtPxIwuPCrdtWwNMiTQn-tOfb2bawrnFbpaVnWFLDqwfzsMy6iFyXoAEm~xaj-dupUkgda0g__",
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

  WorkItem({
    required this.title,
    required this.description,
    required this.cost,
  });
}
