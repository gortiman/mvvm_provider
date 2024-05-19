import 'package:flutter/material.dart';
import 'package:mvvm_provider/counter/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final counterPro = Provider.of<CounterProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Provider"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            counterPro.increment();
          },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<CounterProvider>(builder: (context,value,child){
          return Text(value.counter.toString(),style: TextStyle(fontSize: 20),);
        })
      ),
    );
  }
}
