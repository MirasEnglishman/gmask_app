import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/presentation/widgets/custom_app_bar.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE3E5E8),
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2A40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap:(){_showTakePhotoBottomSheet(context);},
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF1F2A40),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Name Surname',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A40),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'example@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundGrey,
                      foregroundColor: const Color(0xFF1F2A40),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Редактировать профиль',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Column(
              children: [
                const SizedBox(height: 8),
                _buildMenuTile(
                  title: 'Настройки уведомлений',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                _buildMenuTile(
                  title: 'Политика конфиденциальности',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                _buildMenuTile(
                  title: 'Избранное',
                  onTap: () {},
                  badge: '12',
                ),
                const SizedBox(height: 8),
                _buildMenuTile(
                  title: 'Мы в социальных сетях',
                  onTap: () {
                    _showSocialNetworksBottomSheet(context);
                  },
                  socialIcons: true,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {_showExitFromAccount(context);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEEAEA),
                      foregroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Выйти из аккаунта',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Версия: 1.7.1.615',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

void _showExitFromAccount(BuildContext context) {
     showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Выйти из аккаунта',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2A40),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Для входа в аккаунт потребуется повторная авторизация.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Handle logout action
                           Routes.router.navigate(
                    Routes.splashScreen,
                    navigationType: NavigationType.pushReplace,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE74E4E),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Выйти',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F3F5),
                  foregroundColor: const Color(0xFF1F2A40),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Отменить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

 void _showTakePhotoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Загрузить фото профиля',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2A40),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Divider(height: 32, color: AppColors.grey95),
              _buildSocialNetworkItem(
                icon: 'assets/icons/camera-outline.svg',
                text: 'Сделать фото',
                // color: Colors.red,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSocialNetworkItem(
                icon: 'assets/icons/image-outline.svg',
                text: 'Выбрать из галереи',
                // color: Colors.blue,
                onTap: () {},
              ),

             
            ],
          ),
        );
      },
    );
  }



  void _showSocialNetworksBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Мы в социальных сетях',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2A40),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Divider(height: 32, color: AppColors.grey95),
              _buildSocialNetworkItem(
                icon: AppAssets.icYoutube,
                text: 'Смотрите нас на YouTube',
                // color: Colors.red,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSocialNetworkItem(
                icon: AppAssets.icTelegram,
                text: 'Наш Telegram канал',
                // color: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSocialNetworkItem(
                icon: AppAssets.icInstagram,
                text: 'Мы в Instagram',
                gradient: const LinearGradient(
                  colors: [Color(0xFFFCAF45), Color(0xFFE1306C), Color(0xFF5851DB)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSocialNetworkItem(
                icon:  AppAssets.icTiktok,
                text: 'Наш TikTok',
                // color: Colors.black,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialNetworkItem({
    required String icon,
    required String text,
    Gradient? gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:gradient !=null ? const EdgeInsets.symmetric(horizontal:  28): const EdgeInsets.symmetric(horizontal:  24),
        child: Row(
          children: [
            Container(
              width:gradient !=null ? 44 : 48,
              height:gradient !=null ? 44 : 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: gradient,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: gradient !=null ? 30 :40,
                  height: gradient !=null ? 30 :40,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2A40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required String title,
    required VoidCallback onTap,
    String? badge,
    bool socialIcons = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF1F2A40),
              ),
            ),
            const Spacer(),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF1D7AFC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            if (socialIcons)
              Row(
                children: [
                  Image.asset(AppAssets.icSocialNet, scale: 3.5,)
                ],
              ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}