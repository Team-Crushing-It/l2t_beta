import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l2t_beta/home/widgets/page_details.dart';
import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final headers = ['About', 'Our Values', 'Sign-up'];
  var headerIndex = 0;

  final _h1PageController = PageController();

  final _vPageController = PageController();

  final _h1PageNotifier = ValueNotifier<int>(0);

  final _vPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: pi / 2,
                child: StepPageIndicator(
                  stepColor: Colors.black,
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
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      headers[headerIndex],
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 32)),
                    ),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Image.asset(
                        "assets/iconX/arrow.png",
                        width: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: _vPageController,
            onPageChanged: (int index) {
              setState(() {
                headerIndex = index;
              });

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
                      stepColor: Colors.black,
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
                      stepColor: Colors.black,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(width: 200, child: HoverLogo()),
                                  Text("About",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 64),
                                      )),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                              PageDetails(
                                decribing_text: [
                                  Text("build hardware, software,\nand teams",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 32),
                                      )),
                                  Text("better, faster, cheaper",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                ],
                                images: [
                                  "assets/activities_images/sample_img.png",
                                  "assets/activities_images/sample_img.png",
                                  "assets/activities_images/sample_img.png"
                                ],
                                images_bottom_text: [
                                  "Native Mobile",
                                  "Web",
                                  "UX/UI"
                                ],
                              )
                            ],
                          ),
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
                      stepColor: Colors.black,
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
    );
  }
}
