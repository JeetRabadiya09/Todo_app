import 'package:flutter/material.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Add To-Do", style: TextStyle(color: Colors.deepPurple)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
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
            const Text(
              "8:12 AM | 11/02/2022 | Sunday",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 15),
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            TextField(
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
            Row(mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      fixedSize: MaterialStatePropertyAll(
                          Size(screenWidth / 3, screenHeight / 18)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.deepPurple)),
                  onPressed: () {},
                  child: const Text("Add",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      fixedSize: MaterialStatePropertyAll(
                          Size(screenWidth / 3, screenHeight / 18)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.deepPurple)),
                  onPressed: () {},
                  child: const Text("Edit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
