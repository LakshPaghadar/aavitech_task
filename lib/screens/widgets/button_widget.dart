import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../../values/style.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final double? elevation;
  final double? height;
  final double? width;
  final double? radius;
  final double? padding;
  final bool buttonColor;
  final Widget? child;

  const AppButton(this.label, this.callback,
      {super.key,
      double this.elevation = 0.0,
      this.height,
      this.width,
      this.radius,
      this.padding,
      this.buttonColor = false,
      this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      width: width,
      child: MaterialButton(
        elevation: elevation,
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0).r,
        onPressed: callback,
        color: AppColor.favColor,
        shape: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        ),
        child: child ??
            Text(
              label,
              style: textMedium.copyWith(
                color: AppColor.white,
                fontSize: 16.spMin,
              ),
            ),
      ),
    );
  }
}
