import 'package:flutter/material.dart';

void main() {
  runApp(const ConverterApp());
}

class ConverterApp extends StatelessWidget {
  const ConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Converter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeightConverterScreen()),
                );
              },
              child: const Text('Konverter Berat'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CurrencyConverterScreen()),
                );
              },
              child: const Text('Konverter Uang'),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightConverterScreen extends StatefulWidget {
  const WeightConverterScreen({super.key});

  @override
  _WeightConverterScreenState createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
  double inputWeight = 0.0;
  String fromUnit = 'Kilogram';
  String toUnit = 'Gram';
  double result = 0.0;

  final List<String> units = ['Kilogram', 'Gram', 'Miligram', 'Pound'];

  void convert() {
    double weightInGrams;

    switch (fromUnit) {
      case 'Kilogram':
        weightInGrams = inputWeight * 1000;
        break;
      case 'Gram':
        weightInGrams = inputWeight;
        break;
      case 'Miligram':
        weightInGrams = inputWeight / 1000;
        break;
      case 'Pound':
        weightInGrams = inputWeight * 453.592;
        break;
      default:
        weightInGrams = inputWeight;
    }

    switch (toUnit) {
      case 'Kilogram':
        result = weightInGrams / 1000;
        break;
      case 'Gram':
        result = weightInGrams;
        break;
      case 'Miligram':
        result = weightInGrams * 1000;
        break;
      case 'Pound':
        result = weightInGrams / 453.592;
        break;
      default:
        result = weightInGrams;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weight Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Berat'),
              onChanged: (value) {
                inputWeight = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: fromUnit,
              onChanged: (newValue) {
                setState(() {
                  fromUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            const Icon(Icons.arrow_downward),
            DropdownButton<String>(
              value: toUnit,
              onChanged: (newValue) {
                setState(() {
                  toUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Hasil: $result $toUnit', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

// Halaman baru untuk konverter mata uang
class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  double inputAmount = 0.0;
  String fromCurrency = 'Dollar Singapura';
  String toCurrency = 'Rupiah Indonesia';
  double result = 0.0;

  final List<String> currencies = ['Dollar Singapura', 'Rupiah Indonesia', 'Ringgit Malaysia', 'Peso Filipina'];

  // Fungsi konversi mata uang (nilai tukar simulasi)
  void convertCurrency() {
    double rate;

    // Definisikan nilai tukar untuk simulasi
    if (fromCurrency == 'Dollar Singapura' && toCurrency == 'Rupiah Indonesia') {
      rate = 11200;
    } else if (fromCurrency == 'Dollar Singapura' && toCurrency == 'Ringgit Malaysia') {
      rate = 3.4;
    } else if (fromCurrency == 'Dollar Singapura' && toCurrency == 'Peso Filipina') {
      rate = 41;
    } else if (fromCurrency == 'Rupiah Indonesia' && toCurrency == 'Dollar Singapura') {
      rate = 1 / 11200;
    } else if (fromCurrency == 'Rupiah Indonesia' && toCurrency == 'Ringgit Malaysia') {
      rate = 1 / 3300;
    } else if (fromCurrency == 'Rupiah Indonesia' && toCurrency == 'Peso Filipina') {
      rate = 1 / 220;
    } else if (fromCurrency == 'Ringgit Malaysia' && toCurrency == 'Dollar Singapura') {
      rate = 1 / 3.4;
    } else if (fromCurrency == 'Ringgit Malaysia' && toCurrency == 'Rupiah Indonesia') {
      rate = 3300;
    } else if (fromCurrency == 'Ringgit Malaysia' && toCurrency == 'Peso Filipina') {
      rate = 12;
    } else if (fromCurrency == 'Peso Filipina' && toCurrency == 'Dollar Singapura') {
      rate = 1 / 41;
    } else if (fromCurrency == 'Peso Filipina' && toCurrency == 'Rupiah Indonesia') {
      rate = 220;
    } else if (fromCurrency == 'Peso Filipina' && toCurrency == 'Ringgit Malaysia') {
      rate = 1 / 12;
    } else {
      rate = 1;
    }

    result = inputAmount * rate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Jumlah Uang'),
              onChanged: (value) {
                inputAmount = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (newValue) {
                setState(() {
                  fromCurrency = newValue!;
                });
              },
              items: currencies.map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const Icon(Icons.arrow_downward),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (newValue) {
                setState(() {
                  toCurrency = newValue!;
                });
              },
              items: currencies.map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Hasil: $result $toCurrency', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

