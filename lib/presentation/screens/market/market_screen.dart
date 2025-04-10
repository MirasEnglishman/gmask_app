import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  // Список категорий для отрисовки горизонтальных чипов
  final List<String> categories = [
    'Все',
    'Броне пленки',
    'Колодки',
    'Расходники',
  ];

  // Активная категория
  int selectedCategoryIndex = 0;

  // Список товаров
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text("GMASK", style: AppTextStyles.px18W600PrimaryText),
          actions: [
            GestureDetector(
                onTap: () {
                  Routes.router.navigate(
                    Routes.favoriteScreen,
                    navigationType: NavigationType.push,
                  );
                },
                child: SvgPicture.asset(AppAssets.icFavorite)),
            SizedBox(
              width: 20,
            ),
          ]),
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Искать по названию',
                              hintStyle:
                                  AppTextStyles.px14W400PrimaryText.copyWith(
                                color: AppColors.textGrey,
                              ),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey[600]),
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: AppColors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),
                  // Категории (чипы)
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedCategoryIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[700],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            selected: isSelected,
                            backgroundColor: Colors.grey[200],
                            selectedColor:
                                AppColors.additional, // Темно-синий цвет
                            showCheckmark: false,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onSelected: (bool selected) {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Список товаров
            Expanded(
              child: ListView.builder(
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Модель данных товара
class Product {
  final String? imageUrl;
  final String title;
  final String description;
  final String price;
  final bool isFavorited;
  final bool isAvailable;

  Product({
    this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorited = false,
    this.isAvailable = true,
  });
}

/// Виджет карточки товара
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
                        if (ModalRoute.of(context)?.settings.name ==
                            Routes.productDetailScreen) {
                        Routes.router.navigate(
                            Routes.productDetailScreen,
                            navigationType: NavigationType.pushReplace,
                          );
                        } else {
                          Routes.router.navigate(
                            Routes.productDetailScreen,
                            navigationType: NavigationType.push,
                          );
                        }
                      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          // color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            // Левая часть: изображение или иконка
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // скругление изображения
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                imageUrl:
                    "https://s3-alpha-sig.figma.com/img/9894/1a21/4acdf859f28f6a499d5ff714f4d009bc?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jo2P4cT3VDPahcQRJv~1eNnjFpk-NffNjNCSU5EuMFjthFKfiMdgxa1hIpTga21Ej3FshPg-Std-yITAn1teeRBNsO9YMuQ~L562JAfModstCYq6wCF8plpJA~VjyxqbQCF-efB3VctDVLCOoEa7~4MEPewCmzTErTlI1kSd9nJaDevYYaw3rykql0Q2kUc2TZhQhgI7~BnuKQdcBfEfN3glD4S2pJ~lqJ2DfumCyDLJQF7t7K0tw1gPE8L~qva0B2u0CuyGQZuuoQptfq9RT6NTa8GdNyGUznCe559tLN0aPsRbqHmBh2dgYAYt~~vaegyUsnYR5ScZAfpUIvPG-g__",
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 16),
            // Правая часть: текстовое описание работы
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppAssets.icFavorite,
                        color: AppColors.darkGrey,
                        width: 16,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
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
  }
}
