import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/category/take_consultation.dart';
import 'package:gmask_app/presentation/screens/main/widgets/work_widget.dart';
import 'package:gmask_app/presentation/screens/market/market_screen.dart';

class WorkDetailScreen extends StatelessWidget {
  WorkDetailScreen({super.key});

  final List<String> imageUrls = [
    'assets/images/work1.jpg',
    // Add more image URLs as needed
    'assets/images/work2.jpg'
  ];
  // Controller for phone number input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
                    onPressed: () {
                      _showConsultationBottomSheet();
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
          Text("Наши работы", style: AppTextStyles.px16W400PrimaryText),
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
                            child: Image.asset(
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
                          'Полировка',
                          style: AppTextStyles.px20W600PrimaryText,
                        ),
                        const SizedBox(height: 8),
                        // Description
                        Text(
                          'Была произведена полировка кузова Mercedes Benz',
                          style: AppTextStyles.px16W400PrimaryText,
                        ),
                        const SizedBox(height: 12),
                        // Price
                        Row(
                          children: [
                            Text(
                              'Примерная стоимость работы: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            Spacer(),
                            Text('~ 100 000 тг.',
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
                    child: Text("Другие примеры работ",
                        style: AppTextStyles.px16W600PrimaryText),
                  ),
                WorkWidget(),
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
