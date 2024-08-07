import 'package:dummy_api_call_retrofit/screens/widgets/base_app_bar.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/button_widget.dart';
import 'package:dummy_api_call_retrofit/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Signature",
        showTitle: true,
        leadingIcon: true,
        centerTitle: false,
        titleWidgetColor: AppColor.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSignatureView(),
            20.verticalSpace,
            _buildButtonsView()
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          "undo",
          _onReSignClick,
          child: const Icon(
            Icons.undo,
            color: Colors.white,
          ),
        ),
        20.horizontalSpace,
        AppButton(
          "done",
          _onDoneClick,
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  void _onReSignClick(){
    _controller.clear();
  }

  void _onDoneClick() async {
    if (_controller.isNotEmpty) {
      final signature = await _controller.toPngBytes();
      Navigator.of(context).pop(signature);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add sign"),
        ),
      );
    }
  }

  Widget _buildSignatureView() {
    return Signature(
      controller: _controller,
      backgroundColor: Colors.white,
      height: 300,
      width: 300,
    );
  }
}
