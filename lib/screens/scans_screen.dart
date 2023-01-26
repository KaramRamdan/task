import 'package:flutter/material.dart';

class ScansScreen extends StatelessWidget {
  const ScansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Scans',
          style: TextStyle(fontSize: 25),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 6.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(10.0),
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            children:const [
                              Text('Id:'),
                              SizedBox(width: 10),
                              Text('1')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            children:const [
                              Text('Category Id:'),
                              SizedBox(width: 10),
                              Text('1111'),
                              Spacer(),

                              Text('Serial:'),
                              SizedBox(width: 10),
                              Text('1111')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            children:const [
                              Text('Phone Type:'),
                              SizedBox(width: 10),
                              Text('1111'),
                              Spacer(),
                              Text('Pin:'),
                              SizedBox(width: 10),
                              Text('1111'),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

        floatingActionButton:Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: FloatingActionButton(
              onPressed: (){},
            child: const Icon(
              Icons.add_circle_outline_rounded,
                  color: Colors.white70,
              size: 45,

            ),

          ),
        ) ,
    );
  }
}
