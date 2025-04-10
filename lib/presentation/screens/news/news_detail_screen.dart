import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';

/// Виджет отдельного блока новости
class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
          SizedBox(
            width: 12,
          ),
          Text("Назад", style: AppTextStyles.px16W400PrimaryText),
          Spacer()
        ],
      ),
      body: Column(
        children: [
          Card(
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

                Stack(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/e40d/41a7/023cf28e91de4779cc65778291000108?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lu4hVSDKUJoj02A~wN1VRGQfjQ72N6mEx8QwckkaJYUP25BZ-VA7041~xlDSIF8P5Q-XkzWLTtHy8OdEHYEM4BANBnXeoTeL3nh30cIA329Xa1UsPsTSYawAZzEu2F9WW1Rvm56D68aX1ey8nhjyO06H12mCZjEkrZh4TUOq8v2RkWCK2uxcqXyFWK-hg~He-Rdgvq~j5Ujt297wWXqjR~Vj9EIjZegVjnGvHM3GkYJB3V44KdEyyn3WBrR0iqeg3eGfO2uqjRVMKL~q~jxlM-Ekh3XEj1oTXwGdvJMwca8fIcRr4zQJcVaDNOFilXA3lMolpVhOarW86dgxcOa-Tg__',
                          width: double.infinity,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     Positioned(
                      right: 20,
                      top: 20,
                      child: 
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.darkGrey,
                        ),
                        
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.favorite_border, color: AppColors.white, size: 16),
                        ))
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Заголовок
                      Text(
                        'Заголовок блока новостей',
                        style: AppTextStyles
                            .px20W600PrimaryText, // Замените на нужный вам стиль
                      ),
                      const SizedBox(height: 8),
                      // Описание
                      Text(
                        'При создании генератора мы использовали небезизвестный универсальный код речей. Текст генерируется абзацами случайным образом от двух до десяти предложений в абзаце, что позволяет сделать текст более привлекательным и живым для визуально-слухового восприятия.',
                        style: AppTextStyles
                            .px16W400PrimaryText, // Замените на нужный вам стиль
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 120,
                      ),
                      Row(
                        children: [
                          // Время
                          Text(
                            '6 минут назад',
                            style: AppTextStyles
                                .px12W400PrimaryText, // Замените на нужный вам стиль
                          ),
                          const Spacer(),
                          // Иконка лайка и кол-во
                          Icon(Icons.favorite_border,
                              color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            312.toString(),
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
        ],
      ),
    );
  }
}
