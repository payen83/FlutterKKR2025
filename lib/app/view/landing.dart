import 'package:flutter/material.dart';
import 'package:mykkrflutter/app/model/task.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final taskList = <Task>[
    Task('Wash clothes'),
    Task('Do laundry'),
    Task('Do homework'),
    Task('Cooking for dinner')
  ];

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
                    child: H1(text: 'Todo List'),
                  ),
                ),
                _TaskList(
                  taskList: taskList,
                  onTaskDoneChange: (task) {
                    setState((){
                      task.done = !task.done;
                    });
                  }
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

class _TaskList extends StatelessWidget {
  const _TaskList({
    required this.taskList, required this.onTaskDoneChange
  });

  final List<Task> taskList;
  final void Function(Task task) onTaskDoneChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (_,index) => _TaskItem(
          taskList[index],
          key: ValueKey(taskList[index].title),
          onTap: () => onTaskDoneChange(taskList[index]),
        ), 
        separatorBuilder: (_, _) => SizedBox(height: 16,), 
        itemCount: taskList.length
      )
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(
    this.task,{ super.key, this.onTap }
  );

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            child: Row(
              children: [
                Icon(task.done ? Icons.check_box : Icons.check_box_outline_blank),
                SizedBox(width: 10,),
                Text(task.title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class H1 extends StatelessWidget {
  const H1({
    super.key, required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
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
          H1(text: 'New Task'),
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