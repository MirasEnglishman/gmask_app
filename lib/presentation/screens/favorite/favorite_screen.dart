import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/market/market_screen.dart';

/// Виджет экрана избранного
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/a123/bc45/xyz.jpg?Expires=...',
        title: 'Диски модели XPL 4211',
        description:
            'Была произведена полировка кузова Mercedes Benz (текст для за)',
        price: '100 000 тг.',
        isFavorited: false,
      ),
      Product(
        imageUrl: null,
        title: 'Название товара',
        description: 'Описание товара',
        price: 'Стоимость товара',
        isFavorited: false,
        isAvailable: true,
      ),
      Product(
        imageUrl: null,
        title: 'Название товара',
        description: 'Описание товара',
        price: 'Стоимость товара',
        isFavorited: true,
        isAvailable: true,
      ),
      Product(
        imageUrl: null,
        title: 'Название товара',
        description: 'Описание товара',
        price: '',
        isFavorited: false,
        isAvailable: false, // Нет в наличии
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              width: 12,
            ),
            Text("Назад", style: AppTextStyles.px16W400PrimaryText),
          ],
        ),
        actions: const [], // Empty actions to maintain standard AppBar layout
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:  16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ProductCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}