import 'package:flutter/material.dart';
import 'package:my_movie/common/services/first_open_service.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowcaseHandler extends StatefulWidget {
  final Widget child;
  final List<GlobalKey> showcaseKeys;

  const ShowcaseHandler({
    super.key,
    required this.child,
    required this.showcaseKeys,
  });

  @override
  State<ShowcaseHandler> createState() => ShowcaseHandlerState();
}

class ShowcaseHandlerState extends State<ShowcaseHandler> {
  @override
  void initState() {
    super.initState();
    ShowcaseView.register();
  }

  void tryShowcase() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final seen = await FirstOpenService.hasSeenTooltips();
      if (!seen && mounted) {
        ShowcaseView.get().startShowCase(widget.showcaseKeys);
        await FirstOpenService.markTooltipsSeen();
      }
    });
  }

  @override
  void dispose() {
    ShowcaseView.get().unregister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
