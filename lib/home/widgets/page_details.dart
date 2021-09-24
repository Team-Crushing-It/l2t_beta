import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDetails extends StatelessWidget {
  PageDetails({
    required this.decribing_text,
    this.images,
    this.images_bottom_text,
    Key? key,
  }) : super(key: key);

  List<Text> decribing_text;
  List<String>? images;
  List<String>? images_bottom_text;

  @override
  Widget build(BuildContext context) {
    double max_width = MediaQuery.of(context).size.width;
    print(max_width / 2.8);
    print(((max_width / 10) * 3) + 40);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: decribing_text,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: max_width / 10,
                      child: Image.asset(images![0]),
                    ),
                    Text(
                      images_bottom_text![0],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: max_width / 10,
                      child: Image.asset(images![1]),
                    ),
                    Text(
                      images_bottom_text![1],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: max_width / 10,
                      child: Image.asset(images![2]),
                    ),
                    Text(
                      images_bottom_text![2],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
