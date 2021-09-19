import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(create: (_) => MyProvider(), child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Sport> sportList = context.read<MyProvider>().sportList;

    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  SizedBox(width: 50),
                  const Text(
                    "Latest News",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(width: 50),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        color: Colors.blue,
                      )),
                  Text(
                    "Sort",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.assessment,
                        color: Colors.blue,
                      )),
                  Text(
                    "Refine",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 15),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.crop_square,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.list,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                // this help me to scroll in the ListView
                shrinkWrap: true,
                children: sportList
                    .map((item) => Container(
                          height: 145,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            elevation: 10,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    child: Image.asset(
                                      item.imageUrl,
                                      fit: BoxFit.fill,
                                      width: 120,
                                      height: 150,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    //color: Colors.orange,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              width: 65,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  item.sportType.toString() ==
                                                          "SportType.Training"
                                                      ? "Training"
                                                      : "Running",
                                                  style: TextStyle(
                                                      color: Colors.white,fontSize: 13),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 70,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  item.sportType.toString() ==
                                                          "SportType.Training"
                                                      ? "Training"
                                                      : "Running",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          item.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(item.date,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 13,),
                                        Row(
                                          children: [
                                           InkWell(child: Icon(Icons.ac_unit,size: 15,)),
                                            SizedBox(width: 5,),
                                            Text("Logan",style: TextStyle(fontSize: 15),),
                                            SizedBox(width: 21,),
                                            InkWell(child: Icon(Icons.message,size: 15,)),
                                            SizedBox(width: 5,),
                                            Text("${item.number}",style: TextStyle(fontSize: 10),),
                                          ],
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//void fun(){
//  Column(
//    children: [
//      SizedBox(height: 5),
//      Row(
//        children: [
//          Container(
//            height: 20,
//            decoration: BoxDecoration(
//              color: Colors.green,
//              borderRadius: BorderRadius.circular(30),
//            ),
//            child: Center(child: Text(item.sportType.toString() == "SportType.Training" ?"Training":"Running",style: TextStyle(fontSize: 15,color: Colors.white),)),
//          ),
//        ],
//      ),
//      SizedBox(height: 10,),
//      Row(
//        children: [
//          Text(item.description,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//        ],
//      ),
//      SizedBox(height: 15,),
//      Row(
//        children: [
//          Text(item.date),
//        ],
//      ),
//      Row(
//        children: [
//          IconButton(onPressed: (){}, icon: Icon(Icons.star,size: 15,)),
//          Text("Logan"),
//          SizedBox(width: 15),
//          IconButton(onPressed: (){}, icon: Icon(Icons.message,size: 15,)),
//          Text("${item.number}"),
//        ],
//      ),
//
//
//    ],
//  );
//}
