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
                    'assets/images/news1.jpg', // Замените ссылку на реальную
                title: 'Новый сервис в нашем приложении — Автодетейлинг под заказ!',
                description:
                    'Мы рады представить вам новый сервис автодетейлинга, который позволит вашему автомобилю выглядеть как новый!',
                time: '6 минут назад',
                likes: 312,
              ),
              const SizedBox(height: 16),
              // Второй блок новостей (без фотографии — с заглушкой)
              _NewsCard(
                imageUrl:
                    'assets/images/news2.jpg', // Замените ссылку на реальную
                title: 'Освежите свой автомобиль с помощью профессионального детейлинга!',
                description:
                    'Ваш автомобиль заслуживает лучшего ухода. Используйте наш сервис автодетейлинга и подарите своему авто заботу, которую оно заслуживает.',
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
                  child: Image.asset(
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
