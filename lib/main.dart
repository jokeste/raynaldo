import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Slider and Switch Sample')),
        body: const Center(
          child: SliderAndSwitchExample(),
        ),
      ),
    );
  }
}

class SliderAndSwitchExample extends StatefulWidget {
  const SliderAndSwitchExample({Key? key});

  @override
  State<SliderAndSwitchExample> createState() => _SliderAndSwitchExampleState();
}

class _SliderAndSwitchExampleState extends State<SliderAndSwitchExample> {
  double _currentSliderValue = 20;
  bool light = true;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final savedSliderValue = _prefs.getDouble('sliderValue');
    final savedSwitchValue = _prefs.getBool('lightSwitch');
    if (savedSliderValue != null) {
      setState(() {
        _currentSliderValue = savedSliderValue;
      });
    }
    if (savedSwitchValue != null) {
      setState(() {
        light = savedSwitchValue;
      });
    }
  }

  Future<void> _saveSliderValue(double value) async {
    await _prefs.setDouble('sliderValue', value);
  }

  Future<void> _saveSwitchValue(bool value) async {
    await _prefs.setBool('lightSwitch', value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          value: _currentSliderValue,
          max: 100,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            _saveSliderValue(value);
          },
        ),
        Switch(
          value: light,
          activeColor: Colors.red,
          onChanged: (bool value) {
            setState(() {
              light = value;
            });
            _saveSwitchValue(value);
          },
        ),
      ],
    );
  }
}
