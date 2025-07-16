import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          HeaderSection(),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'To Do List', 
                      style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(width: 10,),
                        Text('Task Description')
                      ],
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  } //Widget

  void _showNewTaskModal(BuildContext context) async {
    showModalBottomSheet(
      context: context, 
      builder: (_) => _NewTaskModal(),
    );
  }
} 

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('New Task'),
          SizedBox(height: 26,),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              )
            ),
          ),
          SizedBox(height: 26,),
          ElevatedButton(
            onPressed: (){}, 
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}


class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height*0.3,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage('assets/images/shapes.png'),
                width: 141,
                height: 129,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/tasks-list-image.png'),
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}