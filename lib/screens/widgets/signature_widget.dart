
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignatureWidget extends StatelessWidget {
  Uint8List? signature;
  SignatureWidget({super.key,required this.signature});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 100.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: signature == null
            ? SizedBox()
            : Image.memory(signature!),
      ),
    );
  }
}
