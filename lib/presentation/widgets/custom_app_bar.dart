import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmask_app/core/app_assets.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
// import 'package:gmask_app/presentation/widgets/custom_textfield_with_icon.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight );
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      title: Text("GMASK", style: AppTextStyles.px18W600PrimaryText),
      actions: [
       
       SvgPicture.asset(AppAssets.icBellOutline),
      SizedBox(width: 20,),
     
      
      ],
     
    );
  }
}
