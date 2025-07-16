import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String alertTitle = 'Demo Title';
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double total = 0;

  void calculate(String operation){
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;

    setState(() {
      if(operation == '+'){
        total = num1 + num2;
      } else {
        total = num1 - num2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Alert Box', 
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Press Me'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text(alertTitle),
                      content: Text('Alert box content'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]
                    );
                  }
                );//showDialog
              },
            ),
            SizedBox(height: 20),
            Text('Calculator', 
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: 'Enter first number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Enter second number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Text(
              'Total: $total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      calculate('+');
                    },
                    child: Text('Add'),
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      calculate('-');
                    },
                    child: Text('Subtract'),
                  )
                ),
              ]
            )
          ],
        ),
        
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
