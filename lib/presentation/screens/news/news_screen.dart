import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/widgets/custom_app_bar.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Первый блок новостей (с фотографией)
              _NewsCard(
                imageUrl:
                    'https://s3-alpha-sig.figma.com/img/e40d/41a7/023cf28e91de4779cc65778291000108?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lu4hVSDKUJoj02A~wN1VRGQfjQ72N6mEx8QwckkaJYUP25BZ-VA7041~xlDSIF8P5Q-XkzWLTtHy8OdEHYEM4BANBnXeoTeL3nh30cIA329Xa1UsPsTSYawAZzEu2F9WW1Rvm56D68aX1ey8nhjyO06H12mCZjEkrZh4TUOq8v2RkWCK2uxcqXyFWK-hg~He-Rdgvq~j5Ujt297wWXqjR~Vj9EIjZegVjnGvHM3GkYJB3V44KdEyyn3WBrR0iqeg3eGfO2uqjRVMKL~q~jxlM-Ekh3XEj1oTXwGdvJMwca8fIcRr4zQJcVaDNOFilXA3lMolpVhOarW86dgxcOa-Tg__', // Замените ссылку на реальную
                title: 'Заголовок блока новостей',
                description:
                    'При создании генератора мы использовали небезызвестный универсальный код речи. Текст генерируется абзацами случайным образом...',
                time: '6 минут назад',
                likes: 312,
              ),
              const SizedBox(height: 16),
              // Второй блок новостей (без фотографии — с заглушкой)
              _NewsCard(
                imageUrl:
                    "https://s3-alpha-sig.figma.com/img/e40d/41a7/023cf28e91de4779cc65778291000108?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lu4hVSDKUJoj02A~wN1VRGQfjQ72N6mEx8QwckkaJYUP25BZ-VA7041~xlDSIF8P5Q-XkzWLTtHy8OdEHYEM4BANBnXeoTeL3nh30cIA329Xa1UsPsTSYawAZzEu2F9WW1Rvm56D68aX1ey8nhjyO06H12mCZjEkrZh4TUOq8v2RkWCK2uxcqXyFWK-hg~He-Rdgvq~j5Ujt297wWXqjR~Vj9EIjZegVjnGvHM3GkYJB3V44KdEyyn3WBrR0iqeg3eGfO2uqjRVMKL~q~jxlM-Ekh3XEj1oTXwGdvJMwca8fIcRr4zQJcVaDNOFilXA3lMolpVhOarW86dgxcOa-Tg__", // Передаём null, чтобы показать заглушку
                title: 'Заголовок блока новостей',
                description:
                    'При создании генератора мы использовали небезызвестный универсальный код речи. Текст генерируется абзацами случайным образом...',
                time: '3 минуты назад',
                likes: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет отдельного блока новости
class _NewsCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;
  final String time;
  final int likes;

  const _NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.router.navigate(
          Routes.newsDetailScreen,
          navigationType: NavigationType.push,
        );
      },
      child: Card(
        shadowColor: Colors.transparent,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        clipBehavior:
            Clip.antiAlias, // Обеспечивает обрезку картинки по радиусу
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Если imageUrl != null, показываем картинку. Иначе — иконку-заглушку
            if (imageUrl != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: AppColors.grey51,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  )),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок
                  Text(
                    title,
                    style: AppTextStyles
                        .px14W600PrimaryText, // Замените на нужный вам стиль
                  ),
                  const SizedBox(height: 8),
                  // Описание
                  Text(
                    description,
                    style: AppTextStyles.px14W400PrimaryText.copyWith(
                        color:
                            AppColors.darkGrey), // Замените на нужный вам стиль
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Время
                      Text(
                        time,
                        style: AppTextStyles
                            .px12W400PrimaryText, // Замените на нужный вам стиль
                      ),
                      const Spacer(),
                      // Иконка лайка и кол-во
                      Icon(Icons.favorite_border, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        likes.toString(),
                        style: AppTextStyles
                            .px12W400PrimaryText, // Замените на нужный вам стиль
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
