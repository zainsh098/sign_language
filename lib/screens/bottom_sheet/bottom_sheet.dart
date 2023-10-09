import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomSheetBarPage extends StatefulWidget {
  final String title;

  const BottomSheetBarPage({Key? key, this.title = ''}) : super(key: key);

  @override
  BottomSheetBarPageState createState() => BottomSheetBarPageState();
}

class BottomSheetBarPageState extends State<BottomSheetBarPage> {

  final _bsbController = BottomSheetBarController();


  @override
  Widget build(BuildContext context)

  => Scaffold(
    backgroundColor: Colors.blueGrey.shade50,

    
    body: SafeArea(
      child: BottomSheetBar(

        controller: _bsbController,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        color: Colors.blue.shade50,


        borderRadiusExpanded: const BorderRadius.only(


          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),

        ),
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5.0,
            blurRadius: 32.0,
            offset: const Offset(0, 0),
          ),
        ],
        expandedBuilder: (scrollController) {


          return Material(
            color: Colors.amber.shade50,
            child: CustomScrollView(
              controller: scrollController,
              shrinkWrap: true,
              slivers: [

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          maxLines: 2, // Allows for multiline input
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)

                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
                          ),

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button 1 click
                            },
                            child: Text('Speech'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button 2 click
                            },
                            child: Text('Translation'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          maxLines: null, // Allows for multiline input
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)

                            ),
                            enabled: true,
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
                            labelText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        collapsed: TextButton(
          onPressed: () => _bsbController.expand(),
          child: Text(
            'Click  to expand',
            style: const TextStyle(color: Colors.black),
          ),
        ), body: Center(
        child: Container(

          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width*.90,
          color: Colors.amber,

          child: Text('gi'),



        ),

      ),


      ),
    ),
  );





}
