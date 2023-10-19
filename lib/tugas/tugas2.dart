import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tugas2 extends StatefulWidget {
  const Tugas2({super.key});

  @override
  State<Tugas2> createState() => _Tugas2State();
}

class _Tugas2State extends State<Tugas2> {
  final TextEditingController _celciusController = TextEditingController();
  double kelvin = 0.0;
  double reamur = 0.0;

  void konversiSuhu() {
    setState(() {
      final celcius = double.tryParse(_celciusController.text) ?? 0.0;
      kelvin = celcius + 273.15;
      reamur = celcius * 0.8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Konverter Suhu")),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: TextField(
              controller: _celciusController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Masukkan Suhu Dalam Celcius',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _celciusController.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Suhu dalam Kelvin',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    kelvin.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Suhu dalam Reamor',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    reamur.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: OutlinedButton(
                    onPressed: konversiSuhu,
                    child: const Text('Konversi Suhu'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _celciusController.dispose();
    super.dispose();
  }
}
