import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "cubit/main_screen_cubit.dart";
import "cubit/main_screen_state.dart";

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _field1 = TextEditingController();
  final _field2 = TextEditingController();
  final _field3 = TextEditingController();
  bool _agreement = false;

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Text(
              'Исходный капитал',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _field1,
              validator: (value) {
                if (value!.isEmpty) return 'Введите исходный капитал';
                return null;
              },
            ),
            const Text(
              'Срок начисления процентов',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _field2,
              validator: (value) {
                if (value!.isEmpty) return 'Введите срок начисления процентов';
                return null;
              },
            ),
            const Text(
              'Ставка процентов',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _field3,
              validator: (value) {
                if (value!.isEmpty) return 'Введите ставку процентов';
                return null;
              },
            ),
            CheckboxListTile(
              value: _agreement,
              title: const Text('Я ознакомлен с политикой конфиденциальности'),
              onChanged: (bool? value) => setState(() => _agreement = value ?? false),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _agreement ? () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<MainScreenCubit>(context).calculate(
                    _field1.text,
                    _field2.text,
                    _field3.text,
                  );
                }
              }
              : null,
              child: const Text('Рассчитать'),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildResult(BuildContext context, MainScreenUpdateCounterState state,) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Исходный капитал: ${_field1.text}'),
          Text('Срок начисления процентов: ${_field2.text}'),
          Text('Ставка процентов: ${_field3.text}'),
          Text('Результат: ${state.value}'),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<MainScreenCubit>(context).showForm();
            },
            child: const Text('Назад'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная работа 4 Макковеев Сергей Сергеевич'),
      ),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          if (state is MainScreenUpdateCounterState) {
            return _buildResult(context, state);
          }
          return _buildForm(context);
        },
      ),
    );
  }
}
// class MainScreen extends StatefulWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Лабораторная работа 4 Макковеев Сергей Сергеевич'),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<MainScreenCubit, MainScreenState> (
//         builder: (context, state) {
//           if(state is MainScreenUpdateCounterState)
//             return Center(child: Text('${state.value}', style: Theme.of(context).textTheme.headlineMedium));
//           return Container();
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget> [
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => BlocProvider.of<MainScreenCubit>(context).addValue(),
//           ),
//           const SizedBox(height: 8),
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () => BlocProvider.of<MainScreenCubit>(context).removeValue(),
//           ),
//         ],
//       ),
//     );
//   }
// }