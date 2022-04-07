import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_square/presentation/details/details_screen.dart';
import 'package:space_square/presentation/resources/routing.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/main_back.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Hero(
              tag: 'tah',
              child: Text(
                "Space Square",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Schyler', fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Lottie.asset('assets/solar_planets.json'),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: Colors.white70,
                splashColor: Colors.white70,
                onTap: () {
                  Navigator.of(context)
                      .push(Routing().createRoute(const HomePage()));
                },
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Hero(
                          tag: 'Detailed',
                          child: Text(
                            "Detailed",
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontFamily: 'Schyler',
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_sharp)
                    ]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: Colors.white70,
                splashColor: Colors.white70,
                onTap: () {
                  const snackBar = SnackBar(
                    content: Text('Coming  Soon ! '),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Planets",
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontFamily: 'Schyler',
                              fontSize: 20),
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_sharp)
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
