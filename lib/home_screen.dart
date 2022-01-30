import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  List items = [];
  late String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Form(
          child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Column(children: [
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Insira uma palavra ou número',
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            items.add(textController.text);
                            textController.text = '';
                          });
                        }
                        print(items);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: items.length > 0
                      ? () {
                          Random r = Random();
                          result = items[r.nextInt(items.length)]!;
                          int index = items.indexOf(result);
                          print(result);
                          _requestpop(context);
                          setState(() {
                            items.removeAt(index);
                          });
                          print(items);
                        }
                      : null,
                  child: const Text(
                    'Sortear',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                const SizedBox(height: 30),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(items[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red[400]),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      );
                    }),
              ])),
        ),
      ),
    );
  }

  Future<bool> _requestpop(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sorteado!!'),
          content: Text('"$result" foi sorteado!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(child: Text('OK')),
            ),
          ],
        );
      },
    );
    return Future.value(true);
  }
}
