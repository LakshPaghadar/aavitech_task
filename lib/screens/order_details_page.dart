import 'dart:typed_data';

import 'package:dummy_api_call_retrofit/screens/widgets/base_app_bar.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/product_item_notifier.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/signature_widget.dart';
import 'package:dummy_api_call_retrofit/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/response/customer_with_product.dart';
import '../values/colors.dart';

class OrderDetailsScreen extends StatefulWidget {
  Uint8List? signature;
   OrderDetailsScreen({super.key,required this.signature});

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
          child: Consumer<ProductItemNotifier>(
              builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStoreInfo(),
                16.verticalSpace,
                _buildOrderDetailsTable(provider),
                32.verticalSpace,
                _buildSignature(),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Order Details',
          style: textBold,
        ),
        8.verticalSpace,
      ],
    );
  }

  Widget _buildOrderDetailsTable(ProductItemNotifier provider) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey,
        width: 1.0,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
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
        ...provider.items.map(
          (e) {
            return _buildTableRow(
              [
                e.product.name.toString(),
                e.qnt.toString(),
                e.product.price.toString(),
                _getTotalPrice(e.qnt, e.product.price),
                _getEffectivePrice(
                    e.qnt, e.product.price, e.customerData.discountPercentage),
              ],
            );
          },
        ),
        ...[
          _buildTableRow(
            [
              'Total',
              _getTotalQuantity(provider.items),
              _getTotalUnitPrice(provider.items),
              _getTotalPriceList(provider.items),
              _getTotalOfEffectivePrice(provider.items),
            ],
            isFooter: true,
          ),
        ],
      ],
    );
  }

  String _getTotalOfEffectivePrice(List<CustomerWithProduct> items) {
    double total = 0.0;
    items.forEach(
      (element) {
        total = total +
            double.parse(_getEffectivePrice(element.qnt, element.product.price,
                element.customerData.discountPercentage));
      },
    );
    return total.toStringAsFixed(2);
  }

  String _getEffectivePrice(int q, double? price, double? discount) {
    String total = _getTotalPrice(q, price);
    if (discount == null) {
      return total;
    } else {
      double price = double.parse(total);
      double discountAmount = price * (discount / 100);
      double finalPrice = price - discountAmount;
      return finalPrice.toStringAsFixed(2);
    }
  }

  String _getTotalPriceList(List<CustomerWithProduct> items) {
    double total = 0.0;
    items.forEach(
      (element) {
        if (element.product.price != null) {
          total = total +
              double.parse(_getTotalPrice(element.qnt, element.product.price!));
        }
      },
    );
    return total.toStringAsFixed(2);
  }

  String _getTotalQuantity(List<CustomerWithProduct> items) {
    int total = 0;
    items.forEach(
      (element) {
        total = total + element.qnt;
      },
    );
    return total.toString();
  }

  String _getTotalUnitPrice(List<CustomerWithProduct> items) {
    double total = 0;
    items.forEach(
      (element) {
        if (element.product.price != null) {
          total = total + element.product.price!;
        }
      },
    );
    return total.toStringAsFixed(2);
  }

  String _getTotalPrice(int q, double? price) {
    if (price != null) {
      return (q * price).toStringAsFixed(2);
    } else {
      return "0";
    }
  }

  TableRow _buildTableRow(List<String> cells,
      {bool isHeader = false, bool isFooter = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader
            ? AppColor.color575757
            : isFooter
                ? AppColor.colorc7c7c7
                : Colors.transparent,
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cell,
              style: textMedium.copyWith(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                  color: isHeader ? AppColor.white : Colors.black,
                  overflow: TextOverflow.visible),
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
        SignatureWidget(signature: widget.signature),
      ],
    );
  }
}
