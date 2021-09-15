import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:l2t_beta/home/widgets/widgets.dart';

class Home extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: Home());

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _beaches = [
    Beach(builder: (context) => const IntroHero()),
    Beach(builder: (context) => const FirstSection()),
    Beach(builder: (context) => const SecondSection()),
    Beach(builder: (context) => const ThirdSection()),
    Beach(builder: (context) => const FourthSection()),
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

class FirstSection extends StatelessWidget {
  const FirstSection({Key? key}) : super(key: key);

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
                        width: 300,
                        child: Image.asset('assets/logo/2.png'),
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
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/1.png')),
                ),
              ],
            ),
          ),
        ),
      );
}

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

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
                        width: 300,
                        child: Image.asset('assets/logo/3.png'),
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
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/2.png')),
                ),
              ],
            ),
          ),
        ),
      );
}

class ThirdSection extends StatelessWidget {
  const ThirdSection({Key? key}) : super(key: key);

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
                        width: 300,
                        child: Image.asset('assets/logo/4.png'),
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
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/3.png')),
                ),
              ],
            ),
          ),
        ),
      );
}

class FourthSection extends StatelessWidget {
  const FourthSection({Key? key}) : super(key: key);

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
                        width: 300,
                        child: Image.asset('assets/logo/5.png'),
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
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/4.png')),
                ),
              ],
            ),
          ),
        ),
      );
}
