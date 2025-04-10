import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';

class ProductWidget extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String price;
  final String? oldPrice; // Показываем только если не пустая
  final String? discount; // Показываем ярлык на картинке, если не пустая
  final String buttonText;

  const ProductWidget({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      margin: const EdgeInsets.only(left: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: AppColors.grey,
                  ),
                  splashRadius: 20,
                ),
              ),
              if (discount != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      discount ?? '',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            productTitle,
            style: AppTextStyles.px12W400PrimaryText.copyWith(height: 1.1),
            textAlign: TextAlign.center,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: AppTextStyles.px12W600PrimaryText.copyWith(height: 0.7),
                textAlign: TextAlign.left,
              ),
              if (oldPrice != null)
                Text(
                  oldPrice ?? '',
                  style: AppTextStyles.px10W400PrimaryText.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.textGrey,
                  ),
                  textAlign: TextAlign.left,
                ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: AppTextStyles.px12W600PrimaryText.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
