import 'package:flutter/material.dart';
import 'package:global_state/global_state.dart';

class MyStatefulWidgetApp extends StatefulWidget {
  @override
  _MyStatefulWidgetAppState createState() => _MyStatefulWidgetAppState();
}

class _MyStatefulWidgetAppState extends State<MyStatefulWidgetApp> {
  List<int> counters = [0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful Counter App')),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    addNewCard(counters);
                  });
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final int item = counters.removeAt(oldIndex);
                      counters.insert(newIndex, item);
                    });
                  },
                  children: counters.asMap().entries.map((entry) {
                    final index = entry.key;
                    final value = entry.value;
                    return Card(
                      key: ValueKey(index),
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Text('Counter Value: $value', style: TextStyle(fontSize: 24)),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  incrementCounter(counters, index);
                                });
                              },
                              child: Text('Increment'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  decrementCounter(counters, index);
                                });
                              },
                              child: Text('Decrement'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  removeCard(counters, index);
                                });
                              },
                              child: Text('Remove Card'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyStatefulWidgetApp());
}
