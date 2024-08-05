import 'package:dummy_api_call_retrofit/screens/widgets/base_app_bar.dart';
import 'package:dummy_api_call_retrofit/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Order Details",
        showTitle: true,
        leadingIcon: true,
        centerTitle: false,
        titleWidgetColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStoreInfo(),
              16.verticalSpace,
              _buildOrderDetailsTable(),
              32.verticalSpace,
              _buildSignature(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Coast Holywood',
          style: textBold,
        ),
        8.verticalSpace,
        Text(
          'Discount: 4.0%',
          style: textMedium.copyWith(color: AppColor.favColor),
        ),
      ],
    );
  }

  Widget _buildOrderDetailsTable() {
    return Table(
      border: TableBorder.all(
        color: Colors.grey,
        width: 1.0,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(0.5),
        2: FlexColumnWidth(0.7),
        3: FlexColumnWidth(0.7),
        4: FlexColumnWidth(0.7),
      },
      children: [
        _buildTableRow(
          [
            'Name',
            'Qty',
            'Unit Price',
            'Total Price',
            'Net Price (%)',
          ],
          isHeader: true,
        ),
        _buildTableRow([
          'Broxburn Large Eggs:\n15 Dozen Pp Case',
          '1',
          '18.00',
          '18.00',
          '17.28',
        ]),
        _buildTableRow([
          'Broxburn Large Eggs:\n15 Dozen Pp Case',
          '1',
          '18.00',
          '18.00',
          '17.28',
        ]),
        _buildTableRow([
          'Broxburn Large Eggs:\n15 Dozen Pp Case',
          '1',
          '18.00',
          '18.00',
          '17.28',
        ]),
        _buildTableRow([
          'Broxburn Large Eggs:\n15 Dozen Pp Case',
          '1',
          '18.00',
          '18.00',
          '17.28',
        ]),
        _buildTableRow([
          'Broxburn Large Eggs:\n15 Dozen Pp Case',
          '1',
          '18.00',
          '18.00',
          '17.28',
        ]),

        _buildTableRow([
          'Very Large Eggs: 20\nEggs Tray Loose',
          '2',
          '3.20',
          '6.40',
          '6.14',
        ]),
        _buildTableRow(
          [
            'Total',
            '3',
            '21.20',
            '24.40',
            '23.42',
          ],
          isFooter: true,
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, bool isFooter = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? AppColor.color575757 : isFooter ? AppColor.colorc7c7c7 :Colors.transparent,
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cell,
              style:textMedium.copyWith(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
                color: isHeader ? AppColor.white : Colors.black,
                overflow: TextOverflow.visible
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSignature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Signature'),
        SizedBox(
          width: 150.w,
          height: 50.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
