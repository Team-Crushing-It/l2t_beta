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
    Beach(builder: (context) => const HeroSection()),
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
        onPageChanged: (pageNum) {
          print('changed to $pageNum');
        },
        allowImplicitScrolling: true,
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

class Westkapelle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Westkapelle"),
          backgroundColor: Colors.amber,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 80,
              right: 40,
              child: Crab(
                tag: "container",
                child: Container(
                  color: Colors.green,
                  width: 200,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      );
}

class Zoutelande extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Zoutelande"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 40,
              left: 20,
              child: Crab(
                tag: "container",
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      );
}

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<HeroSection> {
  int rand = 0;
  Image? image0;
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  @override
  void initState() {
    image0 = Image.asset('assets/logo/0.png');
    image1 = Image.asset('assets/logo/1.png');
    image2 = Image.asset('assets/logo/2.png');
    image3 = Image.asset('assets/logo/3.png');
    image4 = Image.asset('assets/logo/4.png');
    image5 = Image.asset('assets/logo/5.png');
    image6 = Image.asset('assets/logo/6.png');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image0!.image, context);
    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
    precacheImage(image4!.image, context);
    precacheImage(image5!.image, context);
    precacheImage(image6!.image, context);
  }

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
                  child: InkWell(
                    onTap: () {},
                    onHover: (v) {
                      setState(() {
                        rand = Random().nextInt(6);
                      });
                    },
                    child: Image.asset('assets/logo/$rand.png'),
                  ),
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
        ));
  }
}

class GoogleiFrame extends StatefulWidget {
  GoogleiFrame({Key? key}) : super(key: key);

  @override
  State<GoogleiFrame> createState() => _GoogleiFrameState();
}

class _GoogleiFrameState extends State<GoogleiFrame> {
  late Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();
  final _screenQueries = ScreenQueries.instance;

  @override
  void initState() {
    super.initState();

    _iframeElement.height = '500';
    _iframeElement.width = '500';

    _iframeElement.src =
        "https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Fproto%2F02VhBYm6D0Kn1YT0IRouMg%2FUntitled%3Fpage-id%3D0%253A1%26node-id%3D2%253A3%26viewport%3D241%252C48%252C0.23%26scaling%3Dcontain%26starting-point-node-id%3D2%253A3";

    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = _screenQueries.customWidthPercent(context, 0.75);
    final _height = _screenQueries.customHeightPercent(context, 0.75);

    return Container(
      color: const Color(0xffF7F9FF),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: _iframeWidget,
      ),
    );
  }
}
