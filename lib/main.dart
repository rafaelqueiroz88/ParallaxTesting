import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Brincando com Parallax'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String moonImage =
      'https://th.bing.com/th/id/R.17b71363db7e4e7942667eedd5b08ab5?rik=fROKs7cVeZQwjA&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f03%2fMoon-PNG.png&ehk=1SnbC0e5tX3G6BL8hnLGX2iHw8t5Z6XyTpQDWsU%2fuPM%3d&risl=&pid=ImgRaw&r=0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Parallax(
        sensor: ParallaxSensor.gyroscope,
        layers: [
          Layer(
            sensitivity: 1,
            image: const NetworkImage(
              'https://wallpapercave.com/wp/wp3028441.jpg',
            ),
            preventCrop: true,
            imageBlurValue: 4,
          ),
          Layer(
            sensitivity: 12,
            image: NetworkImage(moonImage),
            imageHeight: 400,
            imageFit: BoxFit.fitHeight,
            imageBlurValue: 3,
          ),
          // Layer(
          //   sensitivity: 12,
          //   child: const Text('Topmost layer'),
          // ),
        ],
        child: const Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Card(
              color: Color.fromRGBO(140, 140, 140, 0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parallax',
                    style: TextStyle(
                      // color: Colors.tealAccent,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Com giroscópio',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
