import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';

class Planogram extends StatelessWidget {
  const Planogram({super.key});

  @override
  Widget build(BuildContext context) {
    final  Controller  c = Get.put(Controller());
    double height =MediaQuery.sizeOf(context).height;
    double width =MediaQuery.sizeOf(context).width;
    var filterTitle = ["Shelf","Category","Product"];
    Color primaryColor =Colors.teal.shade900;
    Color BgroundColor =Colors.grey.shade300;
    return Scaffold(
        appBar:  AppBar(
          leading: Icon(Icons.filter_list_rounded),
          backgroundColor: primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color:BgroundColor,
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                            ),
                            child: DropdownButton(
                              iconSize: 40,
                              underline: SizedBox(),
                              elevation: 15,
                              value: c.initDrop1.value,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              items: filterTitle.map((e) => DropdownMenuItem(
                                  value: e,
                                  child:Text(e))).toList(),
                              isExpanded: true,
                              onChanged: (String? value) {
                                c.initDrop1.value=value!;
                              },),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: BgroundColor,
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                            ),
                            child: DropdownButton(
                              iconSize: 40,
                              elevation: 15,
                              underline: SizedBox(),
                              value: c.initDrop2.value,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              items: filterTitle.map((e) => DropdownMenuItem(
                                  value: e,
                                  child:Text(e))).toList(),
                              isExpanded: true,
                              onChanged: (String? value) {
                                c.initDrop2.value=value!;
                              },),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.camera_alt_rounded,size: 50,)),
                    Text("Using AI",style: TextStyle(fontSize: 10),),
                  ],
                ),

              ],
            ),
            SizedBox(height: 50,),
            Expanded(child:  Container(
              margin: EdgeInsets.all(15),
              width: width,
              decoration: BoxDecoration(
                color:BgroundColor,
                borderRadius:BorderRadius.all(Radius.circular(10)),
              ),
              child:
              IconButton(onPressed: (){},
                  icon: Icon(Icons.add_outlined,size: 230,color: Colors.white,)),
            ),),

            SizedBox(height: 50,),
            OutlinedButton(onPressed: (){},
              child:  Text("  tacke a Picture ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),),


            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {  },
              child: Text("     Comfirm     ",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)
              ),
            ),
            SizedBox(height: 10,),
          ],
        )
    );
  }
}
