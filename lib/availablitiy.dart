import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import 'controller.dart';

class Availability extends StatelessWidget {
  Availability({super.key});

  var filterTitle = ["Shelf","Category","Product"];
  Color primaryColor =Colors.teal.shade900;
  Color BgroundColor =Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    final  Controller  c = Get.put(Controller());
    double height =MediaQuery.sizeOf(context).height;
    double width =MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.filter_list_rounded),
        backgroundColor: primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child:  Container(
                    margin:  EdgeInsets.only(left: 20 ,right: 20),
                    height: 50,
                    //  width: width*(5/6),
                    decoration: BoxDecoration(
                        color: BgroundColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: BgroundColor.withOpacity(0.5),
                        )]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "   Search....",
                        prefixIcon: Icon(Icons.search_rounded,),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                style: BorderStyle.none
                            )

                        ),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                style: BorderStyle.none
                            )
                        ),
                      ),
                    ),)),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.camera_alt_rounded,size: 40,)),
                  Text("Using AI",style: TextStyle(fontSize: 10),),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  IconButton(onPressed: (){},
                      icon:Icon(Icons.qr_code,size: 40,)),
                  Text("Scan Barcode",style: TextStyle(fontSize: 10),)
                ],
              )],),
          SizedBox(height: 10,),

          getDropList(width,height,c),

          SizedBox(height: 20,),
          Expanded(
              child: getStockList(c)
          ),
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
        ],),
    );
  }

  getDropList(double width, double height, Controller c) {
    return  Container(
      width: width,
      height: height*0.36,
      margin:  EdgeInsets.only(left: 10 ,right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              style: BorderStyle.solid
          )),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Filter",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
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
                  value: c.initDrop2.value,
                  underline: SizedBox(),
                  elevation: 15,
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
                  value: c.initDrop3.value,
                  underline: SizedBox(),
                  elevation: 15,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  items: filterTitle.map((e) => DropdownMenuItem(
                      value: e,
                      child:Text(e))).toList(),
                  isExpanded: true,
                  onChanged: (String? value) {
                    c.initDrop3.value=value!;
                  },),
              ),
            ),
          ),
        ],
      ),);
  }

  getStockList(Controller c) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            color: BgroundColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/im.jpg",
                        width: 50,
                        height: 50,),
                    ),
                    Text("pringles chips 40 bbq")
                  ],),
                Obx(() =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat[0]=!c.isSelectCat[0];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("High Stock")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat[0]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat[1]=!c.isSelectCat[1];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("Low Stock")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat[1]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat[2]=!c.isSelectCat[2];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("Not Available")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat[2]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),],),)
              ],),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            color: BgroundColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/im.jpg",
                        width: 50,
                        height: 50,),
                    ),
                    Text("pringles chips 40 bbq")
                  ],),
                Obx(() =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat2[0]=!c.isSelectCat2[0];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("High Stock")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat2[0]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat2[1]=!c.isSelectCat2[1];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("5")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat2[1]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              c.isSelectCat2[2]=!c.isSelectCat2[2];
                            },
                            child: Container(
                              height:40 ,
                              width: 100,
                              child: Center(child: Text("Not Available")),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: c.isSelectCat2[2]?primaryColor:Colors.white,
                              ),
                            ),
                          ),
                        ),],),)
              ],),),
        ),

      ],
    );
  }
}
