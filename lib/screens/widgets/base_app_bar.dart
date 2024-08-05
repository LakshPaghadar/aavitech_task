import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../values/colors.dart';
import '../../values/style.dart';

//ignore: must_be_immutable
class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  late String? title;
  bool centerTitle = false;
  late Color? backgroundColor;
  late double? elevations;
  List<Widget>? action;
  bool leadingIcon = false;
  bool showTitle = false;
  VoidCallback? backAction;
  Widget? titleWidget;
  Widget? leadingWidget;
  Color? leadingWidgetColor;
  Color? titleWidgetColor;

  BaseAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.backgroundColor = AppColor.primaryColor,
    this.elevations = 0.0,
    this.action,
    this.leadingIcon = false,
    this.showTitle = false,
    this.backAction,
    this.titleWidget,
    this.leadingWidget,
    this.leadingWidgetColor,
    this.titleWidgetColor,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : assert(
          title == null || titleWidget == null,
          "Title and Title widget both can't be null",
        );

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: widget.centerTitle,
      title: !widget.showTitle
          ? const SizedBox.shrink()
          : widget.titleWidget ??
              Text(
                widget.title!,
                style: textBold.copyWith(
                  fontSize: 19.spMin,
                  color: widget.titleWidgetColor,
                ),
              ),
      backgroundColor: AppColor.favColor,
      elevation: widget.elevations,
      automaticallyImplyLeading: false,
      leading: widget.leadingIcon ?
              IconButton(
                icon: const Icon(Icons.arrow_back,color: AppColor.white,),
                onPressed: () {
                  if (widget.backAction != null) {
                    widget.backAction!.call();
                  } else {
                    Navigator.maybePop(context);
                  }
                },
              ) : null,

      iconTheme: const IconThemeData(color: Colors.black),
      actions: widget.action, systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
