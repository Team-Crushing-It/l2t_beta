import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HoverLogo extends StatefulWidget {
  HoverLogo({
    Key? key,
  }) : super(key: key);

  @override
  _HoverLogoState createState() => _HoverLogoState();
}

class _HoverLogoState extends State<HoverLogo> {
  Timer? tick;
  bool isHovering = false;
  Image? imageBlk;
  var position = 0;
  var finalPosition = Random();

  void startAnimate() {
    tick = Timer.periodic(
      const Duration(milliseconds: 1500),
      (timer) {
        // print(position);
        setState(() {
          if (position < 6) {
            position++;
          } else {
            position = 0;
          }
        });
      },
    );
  }

  void stopAnimate() {
    tick?.cancel();
  }

  @override
  void initState() {
    super.initState();

    startAnimate();
  }

  @override
  void dispose() {
    tick?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return L2TLogo(position: position);
  }
}

class L2TLogo extends StatefulWidget {
  const L2TLogo({Key? key, required this.position}) : super(key: key);

  final int position;
  @override
  _L2TLogoState createState() => _L2TLogoState();
}

class _L2TLogoState extends State<L2TLogo> {
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  Image? image7;
  late List<Image?> images;

  @override
  void initState() {
    super.initState();

    image1 = Image.asset('assets/logo/1.png');
    image2 = Image.asset('assets/logo/2.png');
    image3 = Image.asset('assets/logo/3.png');
    image4 = Image.asset('assets/logo/4.png');
    image5 = Image.asset('assets/logo/5.png');
    image6 = Image.asset('assets/logo/6.png');
    image7 = Image.asset('assets/logo/0.png');

    images = [
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      image7,
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
    precacheImage(image4!.image, context);
    precacheImage(image5!.image, context);
    precacheImage(image6!.image, context);
    precacheImage(image7!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: images[widget.position],
      ),
    );
  }
}
