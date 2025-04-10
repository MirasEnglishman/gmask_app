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
        imageUrl: 'https://s3-alpha-sig.figma.com/img/e56d/647b/49154cebf2fe1b4de13982b49f3183a7?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=nLOmW-L-ZXKBZcts1rMiSoDOPthOBweuIH6sUaMxACXWlmn0DrK~YGeCnRFCJgW5fzrAC~W2RqxhCe1-2SA7q2LALOX94f1rDSwl8UB52BPzWO-r-PJ68WuJ5E5wneZiW0JoZrwJv6-OSjyAZFnqOjnzeexWSY6thrsO635dU35kJ6aU5b3hDzfqArrem271rRzwGowzsfnLgb34iYMZdSnD625E0JCa7zN4RhvootIJ1uzQ7rGuqnkYqPhzTeDC6uieB80dxCzLuRzhl6h453bduoS5wJnGrEGWy0C9mpsAfQVUYIrhhrKB1V-dQiL0GA1it4XvZ28XAQdK8T0Enw__'
      ),
      WorkItem(
        title: 'Оклейка в антигравийную пленку',
        description: 'Полная защита от сколов, царапин и внешних возде...',
        cost: 'от 20 000тг',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/8d45/9298/3833525d5ab247fffe948cbd170261f5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=iWqqN7sI82L8TknlpQs2BVXVaCueQMxfwDcJ5xWyx8jiAfoxHgbrHO2~sCmpnMAZWIQK8xtGIcy6zODdJqNhlRWUhVpsCm~hsYUdWreBxaCr12yAPwaRJpaqkL7muF2AwJ~kogiIJBOwKgozCiJQr-Uk~d5~vHN2r~qk11X9Hb1Cf756QZ~lHZQJHZ6XsWBmoDQVMWn8OlB-xJgShXDETtjCvGbisOXXEeyfQaQwiCO3fk-7Aiak9IMVAJLB7ubAqdap1rubYpi0iegtPxIwuPCrdtWwNMiTQn-tOfb2bawrnFbpaVnWFLDqwfzsMy6iFyXoAEm~xaj-dupUkgda0g__'
      ),
      WorkItem(
        title: 'До и после: Химчистка салона',
        description: 'Результат говорит сам за себя - салон как новый...',
        cost: 'от 30 000тг',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/931c/452d/657587f8b71cb56f9b335abd5e9e7780?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ikJYAiPiHiPeYaB~gKMzZxiJcycaiit17MaroEY8C6~kSANsmGpi0aZU95pWiO6D0iWqf9sAbWsT3jHtoDUMa6jr~9Zuq~EaMPPCW1TSWiJAg9ProsJ2naTRHR3f110x5Y2t8x4L1mj~Xu-JIFKIquuq0G4GEMwA~LD-sZNerSaGIYIzhuvYvwbT-UboLsX9Z5YVyACvgRU9W5uV7Uh1bkepwkoPLzC38L8B6zswH0NsED1Zg8j6-tr8ki-lK4nFe5DScZBy1WA5Z4pr48HBvBO~9DKA5lGXO4AwHBfmwbXiyrvZoATKJjml856WsX1y-aSJ~2i80VZ0buO1QFJN2Q__'

      ),
      WorkItem(
        title: 'Без следа от вмятин',
        description: 'Вернем кузовы форму и идеальный вид...',
        cost: 'от 40 000тг',
        imageUrl: 'https://s3-alpha-sig.figma.com/img/3dfe/9266/4b5314ec7ae06ca3800df82afd9f5bf3?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OoWXQgaNFV~~7RV5hPhQaHwXo0O7tq~ovSb-~5b01JyVi4kSDvgu2sbV8G3y2zFNMJ7nnTR6IZifBxsFZ2ZKMbCy7KTVYwZzeTsBLcNsiP9fQe67QzdeUChZILfmIDxAwL5qZa2c8K9BSZEf8vpm5Doi0QgLgbKq9X7wvOc2~RfrLpvFkU6T92ZJC7IMZrd8mtJSAdajvpip8gNLJSwdcKW0RwygfoWJ2P4hUsXSxYMxXnt1bcZo1PyAQWPhIiB0e9ITiQM~3Cvn10USCTDGmqmV3ossbMtMrXiM7Rn~wdbdcFJlVfapIfRdx9z6rs4FInc4uJuSCG~AX7knUrobzg__'

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
