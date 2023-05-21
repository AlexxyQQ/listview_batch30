import 'package:flutter/material.dart';

class CalcView extends StatefulWidget {
  CalcView({super.key});

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  final TextEditingController _display = TextEditingController();
  final List<String> _buttonsP = [
    'C',
    '*',
    '/',
    '<-',
    '1',
    '2',
    '3',
    '*',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '+',
    '%',
    '0',
    '.',
    '=',
  ];
  final List<String> _buttonsL = [
    '1',
    '2',
    '3',
    '/',
    'C',
    '4',
    '5',
    '6',
    '*',
    '',
    '7',
    '8',
    '9',
    '-',
    '%',
    '0',
    '.',
    '<-',
    '+',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator View"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          late var _buttons;
          if (orientation == Orientation.portrait) {
            _buttons = _buttonsP;
          } else {
            _buttons = _buttonsL;
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _display,
                            textAlign: TextAlign.end,
                            decoration: const InputDecoration(
                              hintText: "0",
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontSize: 40.0,
                              height: 2.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 4 : 5,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 1,
                        ),
                        itemCount: _buttons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildButton(_buttons[index]);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          changeText(buttonText);
        },
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }

  void changeText(String text) {
    switch (text) {
      case '<-':
        String currentText = _display.text;
        if (currentText.isNotEmpty) {
          String updatedText = currentText.substring(0, currentText.length - 1);
          _display.text = updatedText;
          _display.selection = TextSelection.fromPosition(
              TextPosition(offset: _display.text.length));
        }
        break;
      case '*':
        _display.text = "${_display.text} * ";
        break;
      case '-':
        _display.text = "${_display.text} - ";
        break;
      case '+':
        _display.text = "${_display.text} + ";
        break;
      case '/':
        _display.text = "${_display.text} / ";
        break;
      case '%':
        _display.text = "${_display.text} % ";
        break;
      case '=':
        _operate();
        break;
      case 'C':
        _display.text = "";
        break;
      default:
        _display.text = _display.text + text;
        setState(() {});
        break;
    }
  }

  void _operate() {
    var a = _display.text.split(' ');
    switch (a[1]) {
      case '+':
        setState(() {
          _display.text = "${int.parse(a[0]) + int.parse(a[2])}";
        });
        break;
      case '-':
        setState(() {
          _display.text = "${int.parse(a[0]) - int.parse(a[2])}";
        });
        break;
      case "/":
        setState(() {
          _display.text = "${int.parse(a[0]) / int.parse(a[2])}";
        });
        break;
      case "*":
        setState(() {
          _display.text = "${int.parse(a[0]) * int.parse(a[2])}";
        });
        break;
      default:
        setState(() {
          _display.text = "ERROR";
        });
        break;
    }
  }
}
