import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/counter_provider.dart';

class Homesreen extends StatelessWidget {
  const Homesreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Selector<CounterProvider, int>(
                selector: (context, provider) => provider.counter,
                builder: (context, count, child) {
                  return Text(
                    'Count: $count',
                    style: TextStyle(fontSize: 24),
                  );
                }),
            Consumer<CounterProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          provider.increment();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          provider.decrement();
                        },
                      ),
                    ],
                  ),
                  Slider(
                    value: provider.counter.toDouble(),
                    min: 0,
                    max: 100,
                    label: 'Counter',
                    divisions: 100,
                    onChanged: (value) => {
                      provider.counter = value.toInt(),
                    },
                  ),
                  Container(
                    height: provider.getContainerHeight,
                    width: provider.getContainerHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(child: Text('i am a counter')),
                  ),
                  Slider(
                    value: provider.getContainerHeight.toDouble(),
                    min: 0,
                    max: 300,
                    label: 'Container',
                    divisions: 100,
                    onChanged: (value) => {provider.setContainerHeight(value)},
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
