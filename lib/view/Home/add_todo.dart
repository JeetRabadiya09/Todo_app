import 'package:flutter/material.dart';

import '../../model/to_do_model.dart';
import '../../res/constant/constant.dart';

class AddToDo extends StatefulWidget {
  final int? index;
  const AddToDo({
    super.key,
    this.index,
  });

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  String time = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  Future displayTimePicker(BuildContext context) async {
    var timeData = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    if (timeData != null) {
      setState(() {
        // time = "${timeData.hour}:${timeData.minute}";
        time = timeData.format(context);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    if (widget.index != null) {
      titleController.text = Constant.toDoModelList[widget.index!].title!;
      contentController.text = Constant.toDoModelList[widget.index!].content!;
      time = Constant.toDoModelList[widget.index!].time!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? "Add To-do" : "Edit To-Do",
            style: TextStyle(color: Colors.deepPurple)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Colors.deepPurple),
                ),
                // contentPadding: const EdgeInsets.all(00),
                isDense: true,
                labelText: "title",
                hintText: "Enter title ",
                contentPadding: const EdgeInsets.all(12),
                hintStyle: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins"),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: Colors.deepPurple),
                ),
                // contentPadding: const EdgeInsets.all(00),
                isDense: true,
                labelText: "contant",
                hintText: "Enter contant ",
                contentPadding: const EdgeInsets.all(30),
                hintStyle: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins"),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            GestureDetector(
              onTap: () => displayTimePicker(context),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54, width: 1.2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(time.isEmpty ? "Hour : minutes" : time),
                    const SizedBox(width: 8),
                    const Icon(Icons.date_range_rounded),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       style: ButtonStyle(
            //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(6))),
            //           fixedSize: MaterialStatePropertyAll(
            //               Size(screenWidth / 3, screenHeight / 18)),
            //           backgroundColor:
            //               const MaterialStatePropertyAll(Colors.deepPurple)),
            //       onPressed: () {},
            //       child: const Text("Add",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.w600)),
            //     ),
            //     ElevatedButton(
            //       style: ButtonStyle(
            //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(6))),
            //           fixedSize: MaterialStatePropertyAll(
            //               Size(screenWidth / 3, screenHeight / 18)),
            //           backgroundColor:
            //               const MaterialStatePropertyAll(Colors.deepPurple)),
            //       onPressed: () {},
            //       child: const Text("Edit",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.w600)),
            //     ),
            //   ],
            // ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (widget.index != null) {
                    //? To Edit to-do model in to-doModel list
                    Constant.toDoModelList[widget.index!] = ToDoModelData(
                      title: titleController.text,
                      content: contentController.text,
                      time: time,
                    );
                    setState(() {});
                  } else {
                    //? To add to-do model in to-doModel list
                    Constant.toDoModelList.add(
                      ToDoModelData(
                        title: titleController.text,
                        content: contentController.text,
                        time: time,
                      ),
                    );
                    setState(() {});
                  }
                  Navigator.pop(context);
                },
                child: Text(widget.index == null ? "Add To-do" : "Edit To-Do"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
