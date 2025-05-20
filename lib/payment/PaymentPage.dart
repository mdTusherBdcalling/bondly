import 'package:bondly/payment/payment_sucessfull.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController billingAddressController =
      TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController discountCodeController = TextEditingController();

  bool summaryVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Payment"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            commonText(
              "Credit card details",
              context: context,
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),

            // Card Number TextField with icons on the right
            commonTextField(
              context: context,
              controller: cardNumberController,
              hintText: "0000 0000 0000 0000",
              keyboardType: TextInputType.number,

              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/cards/visa.png", height: 20),
                  SizedBox(width: 4),
                  Image.asset("assets/cards/mastercard.png", height: 20),
                  SizedBox(width: 4),
                  Image.asset("assets/cards/american express.png", height: 20),
                  SizedBox(width: 4),
                  Image.asset("assets/cards/apple_pay.png", height: 20),
                  SizedBox(width: 8),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: commonTextField(
                    context: context,
                    controller: expiryController,
                    hintText: "MM / YYYY",
                    keyboardType: TextInputType.datetime,

                    suffixIcon: Image.asset(
                      "assets/calender.png",
                      color: AppColors.blackColour,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: commonTextField(
                    context: context,
                    controller: cvcController,
                    hintText: "CVC",
                    keyboardType: TextInputType.number,

                    suffixIcon: Image.asset(
                      "assets/sheed.png",
                      color: AppColors.blackColour,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            commonText(
              "By providing your card information, you allow us to charge your card for future payments in accordance with their terms.",
              context: context,
              size: 12,
              color: AppColors.greyColour,
            ),

            const SizedBox(height: 24),

            commonText(
              "Billing address",
              context: context,
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),

            // Billing Address Dropdown (can be a dropdown widget, for now simple TextField)
            commonTextField(
              context: context,
              controller: billingAddressController,
              hintText: "Indonesia",
              keyboardType: TextInputType.text,

              // You can wrap this with DropdownButton if needed
            ),

            const SizedBox(height: 16),

            commonTextField(
              context: context,
              controller: postalCodeController,
              hintText: "Postal code",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            commonText(
              "Discount code",
              context: context,
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),

            commonTextField(
              context: context,
              controller: discountCodeController,
              hintText: "NEWMEMBER",
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 24),

            // Price summary
            if (summaryVisible)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    _paymentSummaryRow("Price", "\$5.99", context),
                    const SizedBox(height: 8),
                    _paymentSummaryRow("Discount", "-\$0.99", context),
                    const SizedBox(height: 8),
                    _paymentSummaryRow(
                      "Total due",
                      "\$5.00",
                      context,
                      isBold: true,
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 32),

            commonButton(
              context: context,
              title: "Pay Now",
              onTap: () {
                // TODO: Implement payment processing
                if (summaryVisible) {
                  Get.to(
                    () => PaymentSuccessPage(),
                    transition: Transition.rightToLeft,
                  );
                } else {
                  setState(() {
                    summaryVisible = true;
                  });
                }
              },
              bgColor: AppColors.buttonColour,
              fgColor: Colors.white,
              height: 50,
              borderRadius: 12,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentSummaryRow(
    String label,
    String amount,
    BuildContext context, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        commonText(label, context: context, size: 14, isBold: isBold),
        commonText(amount, context: context, size: 16, isBold: isBold),
      ],
    );
  }
}
