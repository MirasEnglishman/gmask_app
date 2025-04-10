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
                        NewsCardWidget(url: "https://s3-alpha-sig.figma.com/img/3f61/e268/2bb61cd564bd31a698d9b862bf13383e?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=XZ-xAntKupLxoaC-F1o0f6Rto5WYOfp~zX4V8urS2bOBlyy02tWAxsvFUOrO9VzMQfEdRGdcmkvHP-e3ygz-jG~ypTiKu3yDFqj59DYz0gOxXcbwwUuKLSoLfUVTdE6CwWd3Um4moKoMAm3Q5Q-qhTMAxkpKzcnd8tB-l51JtZjBPDmx-rVxf2oEY4y5y~am-f0ALPM7sp2kOIzIIlx1PJxKL3X9HoPLFpIG2kMOsow9lqIC9JWV~NEDf3Z9IrBs44YTBgvN5JSYLueI0hqp0pbsrWrA8m3pWDbc0gDvtq4uk0IWLAfCYsDnzOkQTleIkc64NwEl6PtZ7Is16aOOIw__"),
                        NewsCardWidget(url: "https://s3-alpha-sig.figma.com/img/c620/30bf/33c6c6114ee51510356164cfe97be5e2?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JE9ptdgnKQTX2cl8dEeZQCRxPewe6S2UapjLWPSM2hlL2mIVC9EELTHxlImMIjxL1BiFdpU9m6-ymEZPa3TNtFwOLVofq0NsNHjd~v6tPOsHxy0QicMarZC-77Iqe9-mLBn-DhICD8eysWsvpzPEvtQGD02mBuGEypK9g~Eotvg8cTx3~vj3wMK~XFNIaiJwz8xDWriO6ZPbodzH1y7sLjIfjJTkQuvz8RUrC4dm5iyf5x430TgciDu~1VEHcJcWoyW9j4e3RBgNqRLqU~YupJiuKfJkmybp5nLdBaaB5c5v4OTEvNmuH6o8jHBw8eYDEzMoGKxHeJac6Pvbroctag__"),
                        NewsCardWidget(url: "https://s3-alpha-sig.figma.com/img/5b15/7e23/f9228fe20e451530b29c4fe3cb74e892?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qyuFz4Fq5ZtwnfwTTRaGDZwqGdLI68sMc~vKR3q8jji7LVEiEUBMrDc3PrblG014QeU6isXikW5CBoDB2WrFybJPv3ER43c36Fy2bluDtLikGeB~hoDFxzR4Z1nWUV5HyMqBqCBKH789MmGAY4p8l20S~rZF48asnbZrCrfmCAso7RSYios9UBuXDBlgvXKWIeXGuTWiNGD2YWf0aN13Q4Sky~EdKxTCpbAez2Pb3Cb1nRa7Nf~EM-sYYlIhfYKCvwYXZZItWyG0G88nEnZWvUKkGkZuWNO~kc60qklNUMgMfAtQFEr2h5D3B6y-8tt82JIyjgd7A0LOyiF~zxtEXg__"),
                        NewsCardWidget(url: "https://s3-alpha-sig.figma.com/img/4bce/52c9/027fa8a7d671b8ec0ee2aecb7a42ff87?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OmYMkHgwJc2MNPjVZFNvs2hPiywRBvkLL0ntpezxAG0S3OOazYivMzCHlfR8Lby9ittdd-ZaN9XYwy1J4z~p4Nw1Ywh1deKTAD0g6P2oDIJoUhX~LQ1h1fNS6Vuc4wamT0zPz3VRjQu73ad4CcubYhWBVSLhJAcj~sxV7m~o1xjKTKL5IKgWsS5Hs~3f7gYk4EytP0PZV4LiYY1j4jn-naCFfGGySAE9SFqHQSyhKeiSL82x5De2H0K8NeZM15bXIiTLk2oOsb9ScISW17f-KKaNxjmi-I-wNNMnOtAfPkIHlJ~rmpUKqPq2SAzbbPt5rk0QQMu1aaBe5lvIbB1MHg__"),
                        NewsCardWidget(url: "https://s3-alpha-sig.figma.com/img/b508/3046/332b64be0e68c44ca5a8c427ea67dab1?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=U9OrsCcGWefbHfVJtIPctERfElhPUh3SNjULOyeG6y6j~ePluAF0AkLQrYi2GtcQNJ9O~TfnmlebLroEdaBU0FNHX7iSDYx1bBudkdWMDcUSUS3SyFW8oJHumnOn6JnP641niYyydfpbdHNZHFk8Qb2NvgX6RzDu7~rLUfz6hq1SbigPVvDhvEecxKF51d88ojSBCw5auZCmrqCI06ShDv1Y1HVVJ2oAa2jQ1aYJKE7oGpVh8PBizkmVLZcJsMknRjSc7-qJqBjhbBPvSgklE41KwRgwQN1XjaOXxfgvdj3TIciecUOCeGjyHSbu0l5yW~J664EQHFmnggPYzlSn8Q__"),

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
