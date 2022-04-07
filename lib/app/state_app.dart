import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:space_square/presentation/welcome_screen/welcome_screen.dart';

class StateApp extends StatefulWidget {
const StateApp({Key? key}) : super(key: key);
@override
State<StateApp> createState() => _MyAppState();
}

class _MyAppState extends State<StateApp> {
  var brightness = SchedulerBinding.instance!.window.platformBrightness;
  bool _light = false;

  @override
  void initState() {
    _light = brightness == Brightness.light;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    ThemeData _darkTheme = ThemeData(
      cardColor: Colors.grey[600],
      textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontFamily: 'Schyler', color: Colors.white, fontSize: 12)),
      scaffoldBackgroundColor: Colors.grey[900],
      colorScheme: ColorScheme(
        onError: Colors.blueGrey,
        onSecondary: Colors.blueGrey,
        error: Colors.blueGrey,
        background: Colors.blueGrey,
        primary: Colors.blueGrey[300]!,
        onPrimary: Colors.white,
        brightness: Brightness.light,
        onBackground: Colors.white,
        // ignore: deprecated_member_use
        secondaryVariant: Colors.white,
        // ignore: deprecated_member_use
        primaryVariant: Colors.blueGrey,
        onSurface: Colors.white,
        surface: Colors.white,
        secondary: Colors.white,
      ).copyWith(secondary: Colors.white),
    );

    ThemeData _lightTheme = ThemeData(
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blueGrey[900])),
      splashColor: Colors.grey,
      focusColor: Colors.grey,
      highlightColor: Colors.grey,
      cardColor: Colors.white,
      hintColor: Colors.grey,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.grey[200],
      colorScheme: ColorScheme(
          onError: Colors.blueGrey,
          onSecondary: Colors.blueGrey,
          error: Colors.blueGrey,
          background: Colors.blueGrey,
          primary: Colors.blueGrey[900]!,
          onPrimary: Colors.blueGrey,
          brightness: Brightness.light,
          onBackground: Colors.blueGrey,
          // ignore: deprecated_member_use
          secondaryVariant: Colors.blueGrey,
          // ignore: deprecated_member_use
          primaryVariant: Colors.blueGrey,
          onSurface: Colors.blueGrey,
          surface: Colors.blueGrey,
          secondary: Colors.blueGrey)
          .copyWith(secondary: Colors.blueGrey[900]),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _light ? _lightTheme : _darkTheme,
        darkTheme: _darkTheme,
        home: const Intro());
  }
}

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return const WelcomeScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/main_back.jpg',
              ),
              fit: BoxFit.fill),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Hero(
            tag: 'tah',
            child: Text(
              "Space Square",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Schyler', fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
