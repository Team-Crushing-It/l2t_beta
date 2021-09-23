import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeView(),
        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final _h1PageController = PageController();
  final _vPageController = PageController();

  final _h1PageNotifier = ValueNotifier<int>(0);
  final _vPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Transform.rotate(
            angle: pi / 2,
            child: StepPageIndicator(
              itemCount: 3,
              currentPageNotifier: _vPageNotifier,
              size: 16,
              onPageSelected: (number) {
                _vPageController.animateToPage(
                  number,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: _vPageController,
              onPageChanged: (int index) {
                _vPageNotifier.value = index;
                _h1PageNotifier.value = 0;
              },
              children: <Widget>[
                Column(
                  children: [
                    // Step Indicator ======================================================
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: StepPageIndicator(
                        itemCount: 4,
                        currentPageNotifier: _h1PageNotifier,
                        size: 16,
                        onPageSelected: (page) => {
                          _h1PageController.animateToPage(
                            page,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 300),
                          ),
                        },
                      ),
                    ),
                    // Page View ===========================================================
                    Expanded(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _h1PageController,
                        onPageChanged: (int index) {
                          _h1PageNotifier.value = index;
                        },
                        children: <Widget>[
                          Center(
                            child: HoverLogo(),
                          ),
                          const Center(
                            child: Text('Second Page'),
                          ),
                          const Center(
                            child: Text('Third Page'),
                          ),
                          const Center(
                            child: Text('Fourth Page'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // Step Indicator ======================================================
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: StepPageIndicator(
                        itemCount: 4,
                        currentPageNotifier: _h1PageNotifier,
                        size: 16,
                        onPageSelected: (page) => {
                          _h1PageController.animateToPage(
                            page,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 300),
                          ),
                        },
                      ),
                    ),
                    // Page View ===========================================================
                    Expanded(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _h1PageController,
                        onPageChanged: (int index) {
                          _h1PageNotifier.value = index;
                        },
                        children: <Widget>[
                          Center(
                            child: HoverLogo(),
                          ),
                          const Center(
                            child: Text('Second Page'),
                          ),
                          const Center(
                            child: Text('Third Page'),
                          ),
                          const Center(
                            child: Text('Fourth Page'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // Step Indicator ======================================================
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: StepPageIndicator(
                        itemCount: 4,
                        currentPageNotifier: _h1PageNotifier,
                        size: 16,
                        onPageSelected: (page) => {
                          _h1PageController.animateToPage(
                            page,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 300),
                          ),
                        },
                      ),
                    ),
                    // Page View ===========================================================
                    Expanded(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _h1PageController,
                        onPageChanged: (int index) {
                          _h1PageNotifier.value = index;
                        },
                        children: <Widget>[
                          Center(
                            child: HoverLogo(),
                          ),
                          const Center(
                            child: Text('Second Page'),
                          ),
                          const Center(
                            child: Text('Third Page'),
                          ),
                          const Center(
                            child: Text('Fourth Page'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
