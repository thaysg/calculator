import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();

  List<bool> _selection = [false, false, false];

  String perc;

  void upadateButton(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateButton() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final percentage = [0.1, 0.15, 0.2][selectedIndex];

    final finalTotal = (totalAmount * percentage).toStringAsFixed(2);

    setState(() {
      perc = 'R\$ $finalTotal';
    });
  }

  void _resetField() {
    controller.text = " ";
    setState(() {
      perc = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (perc != null)
              Padding(
                padding: EdgeInsets.all(
                  20,
                ),
                child: Text(
                  perc,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            Text(
              'Total',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 120,
              child: TextField(
                style: TextStyle(fontSize: 22),
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '\$100.00',
                  prefixText: 'R\$ ',
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ToggleButtons(
              children: [
                Text(
                  '10%',
                ),
                Text(
                  '15%',
                ),
                Text(
                  '20%',
                ),
              ],
              isSelected: _selection,
              onPressed: upadateButton,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 105,
                    child: TextButton(
                      onPressed: () {
                        calculateButton();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff009933),
                        primary: Colors.white,
                      ),
                      child: Text(
                        'Calcular',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.update,
                      size: 32,
                    ),
                    onPressed: () {
                      _resetField();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
