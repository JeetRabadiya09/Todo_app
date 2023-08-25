import 'package:flutter/material.dart';
import 'package:todo_app/view/Home/add_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddToDo(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: screenHeight / 4.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.deepPurple, width: 2.5)),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth / 20),
                  child: Column(
                    children: [
                      const Text(
                        "To - Do App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22),
                      ),
                      SizedBox(
                        height: screenHeight / 50,
                      ),
                      const Text(
                        "General Setting",
                        style: TextStyle(
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
                          PopupMenuButton(
                            // iconSize: 10,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {},
                                value: 1,
                                child: const Text("edit"),
                              ),
                              PopupMenuItem(
                                onTap: () {},
                                value: 2,
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
