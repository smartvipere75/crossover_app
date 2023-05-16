import 'package:flutter/material.dart';

class HomeSection<Item> extends StatefulWidget {
  final List<Item> items;
  final Function onInit;
  final Function onScroll;
  final Widget? Function(BuildContext, int) itemBuilder;

  const HomeSection(
      {super.key,
      required this.items,
      required this.onInit,
      required this.onScroll,
      required this.itemBuilder});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_scrollListener);
    widget.onInit();
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_pageController.position.pixels ==
        _pageController.position.maxScrollExtent) {
      widget.onScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.items.length,
        itemBuilder: widget.itemBuilder);
  }
}
