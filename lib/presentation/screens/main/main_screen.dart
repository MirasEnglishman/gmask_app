import 'package:cached_network_image/cached_network_image.dart';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/main/widgets/category_grid_widget.dart';
import 'package:gmask_app/presentation/screens/main/widgets/news_card_widget.dart';
import 'package:gmask_app/presentation/screens/main/widgets/product_widget.dart';
import 'package:gmask_app/presentation/screens/main/widgets/work_widget.dart';
import 'package:gmask_app/presentation/widgets/custom_app_bar.dart';
// import 'package:gmask_app/presentation/widgets/footer_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DGisMapController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 10),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        NewsCardWidget(),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyGridWidget(),
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
                    child: Text("Наши работы",
                        style: AppTextStyles.px16W600PrimaryText),
                  ),
                   WorkWidget(),

                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
