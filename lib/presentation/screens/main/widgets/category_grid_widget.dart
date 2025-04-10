import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class MyGridWidget extends StatelessWidget {
  const MyGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Подготовим список данных для сетки с разными иконками и текстами
    final items = [
      GridItemData(icon: AppAssets.icOkleika, label: 'Оклейка и защита'),
      GridItemData(icon:  AppAssets.icRemont, label: 'Кузовной ремонт'),
      GridItemData(icon: AppAssets.icDetailing, label: 'Детейлинг и мойка'),
      GridItemData(icon:  AppAssets.icSalon, label: 'Работа с салоном'),
      GridItemData(icon:  AppAssets.icTuning, label: 'Тюнинг'),
      GridItemData(icon:  AppAssets.icElectronica, label: 'Электроника'),
      GridItemData(icon: AppAssets.icStudy, label: 'Обучение'),
      GridItemData(icon:  AppAssets.icHelp,label: 'Гид'),
    ];

    return GridView.count(
      // Количество столбцов
      crossAxisCount: 4,
      // Отступы между элементами по вертикали
      mainAxisSpacing: 8,
      // Отступы между элементами по горизонтали
      crossAxisSpacing: 8,
      // Если сетка внутри скроллируемого родителя,
      // чтобы GridView не забирал всё доступное пространство
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: items.map((item) => _GridItemWidget(data: item)).toList(),
    );
  }
}

class GridItemData {
  final String icon;
  final String label;

  const GridItemData({required this.icon, required this.label});
}

class _GridItemWidget extends StatelessWidget {
  final GridItemData data;

  const _GridItemWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){        Routes.router.navigate(
          Routes.categoryScreen,
          navigationType: NavigationType.push,
        );},
      child: Container(
        decoration: BoxDecoration(
          // Светло-голубой фон
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                data.icon,
                width: 28,
                height: 28,
                color: AppColors.primary,
              ),
              const SizedBox(height: 8),
              Text(
                data.label,
                style: AppTextStyles.px10W400PrimaryText,
              )
            ],
          ),
        ),
      ),
    );
  }
}