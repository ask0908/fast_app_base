import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStock(context),
      ],
    );
  }

  Widget getMyAccount(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20
    ),
    color: context.appColors.roundedLayoutBackground,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        "계좌".text.color(Colors.white).make(),
        Row(
          children: [
            "443원".text.size(24).color(Colors.white).bold.make(),
            const Arrow(
              color: Colors.white,
            ),
            emptyExpanded,
            RoundedContainer(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              radiusValue: 8,
              color: context.appColors.buttonBackGround,
              child: "채우기".text.color(Colors.white).size(12).make(),
            ),
            width20,
          ],
        ),
        height30,
        Line(
          color: context.appColors.divider,
        ),
        height10,
        LongButton(title: "주문내역"),
        LongButton(title: "판매수익"),
      ],
    ),
  );

  Widget getMyStock(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "관심주식".text.color(Colors.white).bold.make(),
                "편집하기".text.color(context.appColors.lessImportant).make(),
              ],
            ),
            height20,
            Tap(
              onTap: () {
                context.showSnackbar("기본");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "기본".text.color(Colors.white).make(),
                    const Arrow(
                      direction: AxisDirection.up,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      InterestStockList().pSymmetric(h: 20),
    ],
  );
}