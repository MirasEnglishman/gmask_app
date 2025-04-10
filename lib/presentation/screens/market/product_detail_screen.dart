import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/main/widgets/work_widget.dart';
import 'package:gmask_app/presentation/screens/market/market_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  final List<String> imageUrls = [
    "https://s3-alpha-sig.figma.com/img/9894/1a21/4acdf859f28f6a499d5ff714f4d009bc?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jo2P4cT3VDPahcQRJv~1eNnjFpk-NffNjNCSU5EuMFjthFKfiMdgxa1hIpTga21Ej3FshPg-Std-yITAn1teeRBNsO9YMuQ~L562JAfModstCYq6wCF8plpJA~VjyxqbQCF-efB3VctDVLCOoEa7~4MEPewCmzTErTlI1kSd9nJaDevYYaw3rykql0Q2kUc2TZhQhgI7~BnuKQdcBfEfN3glD4S2pJ~lqJ2DfumCyDLJQF7t7K0tw1gPE8L~qva0B2u0CuyGQZuuoQptfq9RT6NTa8GdNyGUznCe559tLN0aPsRbqHmBh2dgYAYt~~vaegyUsnYR5ScZAfpUIvPG-g__",
    // Add more image URLs as needed
    "https://s3-alpha-sig.figma.com/img/9894/1a21/4acdf859f28f6a499d5ff714f4d009bc?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jo2P4cT3VDPahcQRJv~1eNnjFpk-NffNjNCSU5EuMFjthFKfiMdgxa1hIpTga21Ej3FshPg-Std-yITAn1teeRBNsO9YMuQ~L562JAfModstCYq6wCF8plpJA~VjyxqbQCF-efB3VctDVLCOoEa7~4MEPewCmzTErTlI1kSd9nJaDevYYaw3rykql0Q2kUc2TZhQhgI7~BnuKQdcBfEfN3glD4S2pJ~lqJ2DfumCyDLJQF7t7K0tw1gPE8L~qva0B2u0CuyGQZuuoQptfq9RT6NTa8GdNyGUznCe559tLN0aPsRbqHmBh2dgYAYt~~vaegyUsnYR5ScZAfpUIvPG-g__",
  ];
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
      persistentFooterButtons: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
                    onPressed: () {
                      // Handle logout action
                      // Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.additional,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Заказать товар',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
        ),
      ],
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          SizedBox(width: 12),
          Text("Назад", style: AppTextStyles.px16W400PrimaryText),
          Spacer()
        ],
      ),
      body: Container(
        color: AppColors.backgroundGrey,
        child: ListView(
          children: [
            Card(
              shadowColor: Colors.transparent,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              clipBehavior: Clip.antiAlias, // To ensure image clipping
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image gallery (horizontal scroll view)
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrls[index],
                              width: 360,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product title
                        Text(
                          'Диски модели XPL 4211',
                          style: AppTextStyles.px20W600PrimaryText,
                        ),
                        const SizedBox(height: 8),
                        // Description
                        Text(
                          'Сайт разработан для того, чтобы помочь дизайнерам и вебмастерам генерировать текст на русском языке. Текст включает несколько абзацев для более осмысленного восприятия.',
                          style: AppTextStyles.px16W400PrimaryText,
                        ),
                        const SizedBox(height: 12),
                        // Price
                        Row(
                          children: [
                            Text(
                              'Стоимость: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            Spacer(),
                            Text('100 000 тг.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
        
                        // 'Order Now' butto
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Сопутствующие товары",
                        style: AppTextStyles.px16W600PrimaryText),
                  ),
                 ListView.separated(
                  shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,separatorBuilder: (context, index) =>
            const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
