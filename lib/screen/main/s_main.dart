import 'dart:convert';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/widget/animated_number_text.dart';
import 'package:fast_app_base/common/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  // connect()에 넘길 때 Uri.parse() 써도 되고 안 써도 됨
  // final wsUrl = Uri.parse("wss//stream.binance.com:9443/ws/btcusdt@trade");
  late final channel = IOWebSocketChannel.connect("wss://stream.binance.com:9443/ws/btcusdt@trade");
  late final Stream<dynamic> stream;

  String priceString = "Loading";
  final List<double> priceList = [];

  // 1초마다 업데이트하게
  final intervalDuration = 1.seconds;
  DateTime lastUpdatedTime = DateTime.now();

  @override
  void initState() {
    stream = channel.stream;
    stream.listen((event) {
      final obj = json.decode(event); // Map 타입으로 넘어옴
      final double price = double.parse(obj["p"]);

      if (DateTime.now().difference(lastUpdatedTime) > intervalDuration) {
        lastUpdatedTime = DateTime.now();
        setState(() {
          priceList.add(price);
          priceString = price.toDoubleStringAsFixed();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedNumberText(
                    priceString,
                    textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    duration: 50.ms,
                  ),
                  LineChartWidget(
                    priceList,
                    maxPrice: 10000000,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}