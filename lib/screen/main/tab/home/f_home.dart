import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {

  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvider);

      // 스크롤 거리가 100 이상이고 큰 상태라면
      if (scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 && floatingState.isSmall) {
        // 다시 위로 스크롤 올리고 아직 작은 상태라면
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          height: 500,
          color: Colors.red,
        ),
        Container(
          height: 500,
          color: Colors.blue,
        ),
        Container(
          height: 500,
          color: Colors.red,
        ),
        Container(
          height: 500,
          color: Colors.blue,
        ),
      ],
    );
  }
}