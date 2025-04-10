import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/category/take_consultation.dart';
import 'package:gmask_app/presentation/widgets/custom_app_bar.dart';
import 'package:gmask_app/routes.dart';
import 'package:seafarer/seafarer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    'Все',
    'Броне пленки',
    'Колодки',
    'Расходники',
  ];

  // Активная категория
  int selectedCategoryIndex = 0;
  
  // Controller for phone number input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Method to show the bottom sheet
 void _showConsultationBottomSheet() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return ConsultationBottomSheet(
        nameController: _nameController,
        phoneController: _phoneController,
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: _showConsultationBottomSheet, // Call the method to show bottom sheet
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.additional,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Заказать консультацию',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
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
        actions: const [],
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.white,
                height: 50,
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
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        selected: isSelected,
                        backgroundColor: Colors.grey[200],
                        selectedColor: AppColors.additional,
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
              Container(
                color: AppColors.backgroundGrey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 21,
                    ),
                    _CategoryCard(
                      imageUrl:
                          'https://okleyka.pro/upload/iblock/122/mercedes-grey-vinyl-wrapping-okleyka-pro-5.jpg',
                      title: 'Защитный комплект «Старт»',
                      description:
                          'Начальный комплект защиты для автомобиля, Вы на деле убедитесь что защита работает и обязательно закажете апгрэйд до комплекта "Стандарт" или "Люкс", а возможно и полную оклейку, так как при полной оклейке автомобиля мы установим защиту лобового стекла ClearPlex бесплатно! Мы официально устанавливаем антигравийные пленки Hexis Bodyfence X и Xpel Ultimate Plus. Антигравийная пленка Hexis Bodyfence X устанавливается с документальной Пожизненной гарантией* от производителя.',
                    ),
                    const SizedBox(height: 16),
                    _CategoryCard(
                      imageUrl:
                          'https://eastline-garage.ru/images/portfolio/avtovinil/MERSEDES_222/lorein-0936.jpg',
                      title: 'Защитный комплект «Старт»',
                      description:
                          'Начальный комплект защиты для автомобиля, Вы на деле убедитесь что защита работает и обязательно закажете апгрэйд до комплекта "Стандарт" или "Люкс", а возможно и полную оклейку, так как при полной оклейке автомобиля мы установим защиту лобового стекла ClearPlex бесплатно! Мы официально устанавливаем антигравийные пленки Hexis Bodyfence X и Xpel Ultimate Plus. Антигравийная пленка Hexis Bodyfence X устанавливается с документальной Пожизненной гарантией* от производителя.',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;

  const _CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shadowColor: Colors.transparent,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.px14W600PrimaryText,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.px14W400PrimaryText.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Стоимость: ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'от 100 000 тг.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      )
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