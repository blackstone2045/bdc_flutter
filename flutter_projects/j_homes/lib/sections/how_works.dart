import 'package:flutter/material.dart';

class HowWorks extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    Container worksContainer(BuildContext context, {String? sl, String? text}) {
      return Container(
        margin: EdgeInsets.all(13),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(75, 255, 255, 255),
          //backgroundBlendMode: BlendMode.clear,
          borderRadius: BorderRadius.circular(13),
        ),
        child: RichText(
          text: TextSpan(
            text: sl,
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 907,
      width: 375,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        image: DecorationImage(
          image: AssetImage('assets/images/couples.jpg'),
          fit: BoxFit.cover,
        ),
        // gradient: LinearGradient(
        //   begin: AlignmentGeometry.bottomEnd,
        //   end: AlignmentGeometry.topStart,
        //   colors: [
        //     Color.fromARGB(178, 15, 0, 0),
        //     Color.fromARGB(139, 255, 255, 255),
        //   ],
        // ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: LinearGradient(
            begin: AlignmentGeometry.bottomEnd,
            end: AlignmentGeometry.topStart,
            colors: [
              const Color.fromARGB(255, 0, 0, 0),
              const Color.fromARGB(75, 255, 255, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            worksContainer(
              context,
              sl: "01 ",
              text: "—Register and Verify your Identity for a Safer Experience",
            ),
            worksContainer(
              context,
              sl: "02 ",
              text:
                  "—Create New Rental or Onboard Your Ongoing Rental Agreement",
            ),
            worksContainer(
              context,
              sl: "03 ",
              text: "—Start Connecting the Power of Collaboration",
            ),
          ],
        ),
      ),
    );
  }
}
