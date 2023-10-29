import 'package:dogs/core/constant/images.dart';
import 'package:dogs/features/widget/box_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Box.vertical(30),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  const Box.horizontal(10),
                  Text(
                    'DogZone',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange
                    ),
                  ),
                ],
              ),
            ),
            const Box.vertical(30),
            Expanded(
              flex: 10,
              child: Container(
                // color: Colors.blue,
                margin: const EdgeInsets.all(40),
                child: Image.asset(AppImages.intro),
              ),
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              // color: Colors.yellow,
              child: Text(
                'Embark on a journey to discover various dog breeds spanning the globe.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              // color: Colors.green,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
                child: InkWell(
                  onTap: () {
                    context.push('/explore');
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration:
                    
                        BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                    child: const Center(
                      child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
