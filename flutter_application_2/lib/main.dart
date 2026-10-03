import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _field1 = TextEditingController();
  final _field2 = TextEditingController();
  final _field3 = TextEditingController();
  bool _agreement = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная работа 2 Макковеев Сергей Сергеевич'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget> [
              const Text(
                'Исходный капитал',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _field1,
                validator: (value) {
                if (value!.isEmpty) return 'Введите искодный капитал';
              }),
              const Text(
                'Срок начисления процентов',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _field2,
                validator: (value) {
                if (value!.isEmpty) return 'Введите срок начисления процентов';
              }),
              const Text(
                'Ставка процентов',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _field3,
                validator: (value) {
                if (value!.isEmpty) return 'Введите ставку процентов';
              }),
              
              CheckboxListTile(
                value: _agreement,
                title: new Text('Я ознакомлен с политикой конфиденциальности'),
                onChanged: (bool? value) => setState(() => _agreement = value!)
              ),

              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _agreement ? () {
                  if (_formKey.currentState!.validate()) {
                    print(_field1.text);
                    print(_field2.text);
                    print(_field3.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          SecondScreen(field1: _field1.text, field2: _field2.text, field3: _field3.text)
                      )
                    );
                  }
                }
                : null,
                child: const Text('Рассчитать'),
              ),



          ],
          ),
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String field1;
  final String field2;
  final String field3;
  SecondScreen({
    super.key,
    required this.field1, 
    required this.field2, 
    required this.field3,
    });
  @override
  Widget build(BuildContext context) {

    final double f1 = double.tryParse(field1) ?? 0;
    final double f2 = double.tryParse(field2) ?? 0;
    final double f3 = double.tryParse(field3) ?? 0;
    final double result = f1 * f2 * f3;

    return Scaffold(
      appBar: AppBar(title: Text('Ответ')),
      body: Center(
        child: Form(
          child:  Column(
            children: <Widget> [
              
              Text('Исходный капитал: $field1 '),
              Text('Срок начисления процентов: $field2'),
              Text('Ставка процентов: $field3'),

              Text('Результат: $result'),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Назад'),
              ),



            ]
          )
        )
        
        
        
      )
    );
  }
}