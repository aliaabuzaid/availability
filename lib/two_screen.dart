import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';

class Two extends StatelessWidget {
  Two({super.key});
  Color primaryColor = Colors.teal.shade900;
  Color BgroundColor = Colors.grey.shade300;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;


    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.filter_list_rounded),
          backgroundColor: primaryColor,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Expanded(
                child: Column(
                  children: [  getCardContainer(width,"Before"),
                    getCardContainer(width,"After"),],
                )),

            ElevatedButton(
              onPressed: () {  },
              child: Text("    Comfirm    ",style: TextStyle(
                  fontSize: 24,
                  color: Colors.white
              ),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)
              ),
            ),
            SizedBox(height: 10,)
          ],
        )
    );
  }

  getCardContainer(double width,String s) {
    var Title = ["shelf","Category", s];

    return  Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: width,
        height: 140,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(style: BorderStyle.solid)),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    //  margin: EdgeInsets.all(8),
                    width: 110,
                    decoration: BoxDecoration(
                      color: BgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_outlined,
                            size: 100,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: Title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: BgroundColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(Title[index])),
                      );
                    },

                  ),

                ),
              ]),
        ),
      ),
    );
  }
}
