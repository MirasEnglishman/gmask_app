import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // Задаём нужную высоту
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        // Эти свойства можно убрать, если цвет задаётся непосредственно в иконках
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icHome,
              color: currentIndex == 0 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icNews,
              color: currentIndex == 1 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icCart,
              color: currentIndex == 2 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: 'Маркет',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icProfile,
              color: currentIndex == 3 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
