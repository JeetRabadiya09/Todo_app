import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/Home/add_todo.dart';

import '../../res/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<ToDoModelData> toDoModelList = [];
  //

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("To-Do App", style: TextStyle(color: Colors.deepPurple)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constant.toDoModelList.isEmpty
                ? const Center(
                    child: Text(
                      "Not To-Do Found",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: Constant.toDoModelList.length,
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: screenHeight / 4.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.deepPurple, width: 2.5)),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth / 20),
                        child: Column(
                          children: [
                            Text(
                              "Title: ${Constant.toDoModelList[index].title}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              height: screenHeight / 50,
                            ),
                            Text(
                              "content: ${Constant.toDoModelList[index].content}",
                              // toDoModelList[index].content!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Text(
                              "time: ${Constant.toDoModelList[index].time}",
                              // toDoModelList[index].content!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: screenHeight / 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "8:12 AM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Constant.toDoModelList.removeAt(index);
                                    });
                                  },
                                  color: Colors.blue,
                                  icon: const Icon(CupertinoIcons.pen),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddToDo(index: index),
                                      ),
                                    ).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  color: Colors.red,
                                  icon: const Icon(CupertinoIcons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddToDo(),
              ));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add To-do'),
      ),
    );
  }
}
