import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedBoxCenter extends StatelessWidget {
  Widget child1;
   SizedBoxCenter({super.key,required this.child1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100.h, width:1.sw,child: Center(child: child1));
  }
}
