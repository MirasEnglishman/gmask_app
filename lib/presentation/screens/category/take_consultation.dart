import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';

class ConsultationBottomSheet extends StatefulWidget {
  const ConsultationBottomSheet({
    required this.nameController,
    required this.phoneController,
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  State<ConsultationBottomSheet> createState() => _ConsultationBottomSheetState();
}

class _ConsultationBottomSheetState extends State<ConsultationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Заказать консультацию',
                style: AppTextStyles.px16W400PrimaryText,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          Divider(color: AppColors.grey95, height: 10),
          const SizedBox(height: 14),
          Text(
            'Имя',
            style: AppTextStyles.px14W400PrimaryText,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: widget.nameController,
            decoration: InputDecoration(
              hintText: 'Введите Ваше имя',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Контактный телефон',
            style: AppTextStyles.px14W400PrimaryText,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: '+7 (___) - ___ - ___ - __',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Открытие всплывающего окна
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.white,
                    contentPadding: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    content: Container(
                      color: AppColors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/verify.svg', width: 60,),
                          const SizedBox(height: 12),
                          Text(
                            'Ваша заявка принята!',
                            style: AppTextStyles.px16W600PrimaryText,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Менеджер обязательно свяжется с вами в ближайшее время!',
                            style: AppTextStyles.px14W400PrimaryText,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Закрытие диалога
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.additional,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'К услугам',
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
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.additional,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
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
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
