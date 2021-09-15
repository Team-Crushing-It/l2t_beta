import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:l2t_beta/home/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: Home());

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _beaches = [
    Beach(builder: (context) => const IntroHero()),
    Beach(builder: (context) => const ServeSection()),
    Beach(builder: (context) => const FreeSection()),
    // Beach(builder: (context) => Westkapelle()),
    // Beach(builder: (context) => Zoutelande()),
  ];

  final _coastController = CoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Coast(
        scrollDirection: Axis.vertical,
        beaches: _beaches,
        controller: _coastController,
        observers: [
          CrabController(),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class IntroHero extends StatelessWidget {
  const IntroHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xffF7F9FF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Crab(
              tag: 'container',
              child: Container(
                height: 300,
                width: 500,
                child: Image.asset('assets/logo/1.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Text('Bring your vision to life',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline1!
                      .copyWith(fontSize: 50)),
            )
          ],
        ),
      ),
    );
  }
}

class ServeSection extends StatelessWidget {
  const ServeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: const Color(0xffF7F9FF),
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        child: Image.asset('assets/logo/1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Serve',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Image.asset('assets/homepage_lines/1.png'),
                ),
              ],
            ),
          ),
        ),
      );
}

class FreeSection extends StatelessWidget {
  const FreeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        child: Image.asset('assets/logo/2.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Free',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Image.asset('assets/homepage_lines/2.png'),
                ),
              ],
            ),
          ),
        ),
      );
}
