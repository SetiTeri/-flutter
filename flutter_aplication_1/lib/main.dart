import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лабораторная работа 1 Макковеев Сергей Сергеевич'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Здесь будут ваши виджеты

          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(6, (index) {
              return Container(
                width: 100,
                height: 100,
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(child: Text('Container $index')),
              );
            }),
          ),
          

          Column(
            children: [
              Text('ФИО: Макковеев Сергей Сергеевич', style: TextStyle(fontSize: 20)),
              Text('Год рождения: 2003', style: TextStyle(fontSize: 20)),
              Text('Группа: зИСТУ-23', style: TextStyle(fontSize: 20)),
            ],
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.favorite),
                  Icon(Icons.home),
                ],
              ),
              // Добавьте другие Row по аналогии
            ],
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.red, width: 200, height: 200),
              Container(color: Colors.green, width: 150, height: 150),
              Container(color: Colors.blue, width: 100, height: 100),
            ],
          ),

          Wrap(
            spacing: 8.0,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.amber,
                child: Text('ФИО: Макковеев Сергей Сергеевич'),
              ),
              // Добавьте другие контейнеры с текстом
            ],
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.blind,
                    color: Colors.green,
                    size: 50,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 50,
                  ),
                  Icon(
                    Icons.drive_eta,
                    color: Colors.black,
                    size: 50,
                  ),
                  Icon(
                    Icons.sentiment_very_dissatisfied_outlined,
                    color: Colors.red,
                    size: 50,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.man,
                    color: Colors.blue,
                    size: 25,
                  ),
                  Icon(
                    Icons.liquor,
                    color: Colors.brown,
                    size: 25,
                  ),
                  Icon(
                    Icons.battery_0_bar,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                    size: 12,
                  ),
                  Icon(
                    Icons.lunch_dining,
                    color: Colors.brown,
                    size: 12,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.masks,
                    color: Colors.grey,
                    size: 5,
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}