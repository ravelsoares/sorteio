import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  List items = ['Carlos', 'Ravel', 'João'];
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
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(items[index]),
                        trailing: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                        ),
                      );
                    }),
              ])),
        ),
      ),
    );
  }
}
