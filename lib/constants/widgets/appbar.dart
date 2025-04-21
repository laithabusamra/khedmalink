import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.logoWidget,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Widget? logoWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 1,
      centerTitle: true, // This centers the title
      leading: logoWidget ??
          (showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                )
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed,
                      icon: Icon(leadingIcon),
                    )
                  : null),
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

// Usage example where this AppBar would maintain the purple background
class TColorBar extends StatelessWidget {
  const TColorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: buttounColor,
      height: TSizes.spaceBtwItems,
    );
  }
}
