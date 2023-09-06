import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/to_do_model.dart';
import '../../res/constant/constant.dart';

class AddTodoScreen extends StatefulWidget {
  final int? index;
  const AddTodoScreen({
    super.key,
    this.index,
  });

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  String time = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  SharedPreferences? prefs;

  setInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

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

  setTodoData() {
    prefs!.setString(
        "ToDoModelData",
        json.encode(
            Constant.toDoModelList.map((value) => value.toJson!()).toList()));
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstance();

    if (widget.index != null) {
      titleController.text = Constant.toDoModelList[widget.index!].title!;
      contentController.text = Constant.toDoModelList[widget.index!].content!;
      time = Constant.toDoModelList[widget.index!].time!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? "Add To-do" : "Edit To-Do"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 20,
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
            // AppTextFiled(
            //   controller: titleController,
            //   hintText: "Enter Title",
            //   textInputType: TextInputType.text,
            // ),
            // const SizedBox(height: 15),
            // AppTextFiled(
            //   controller: contentController,
            //   hintText: "Enter Content",
            //   textInputType: TextInputType.text,
            // ),
            const SizedBox(height: 15),
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
                    Text(time.isEmpty ? "hh : mm" : time),
                    const SizedBox(width: 8),
                    const Icon(Icons.date_range_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
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
                  setTodoData();
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
