// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:news_paper_api/Model/news_model.dart';
// import 'package:news_paper_api/Services/news_api_services.dart';
// import 'package:news_paper_api/Widget/const.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Articles> newList = [];
//   @override
//   void dispose() async {
//     newList = await NewsApiService().fetchNewsData();

//     setState(() {});
//     print("${newList.lengthy}");
//     // TODO: implement dispose
//     super.dispose();
//   }

//   int currentIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: Icon(
//           Icons.menu,
//         ),
//         title: Text(
//           "News App",
//           style: myStyle(
//             19,
//             Colors.black,
//             FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.search,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 12,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "All News",
//                 style: myStyle(
//                   12,
//                   Colors.black,
//                   FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.1,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     paginationButton(
//                       onTap: () {},
//                       title: 'Prev',
//                     ),
//                     Flexible(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 10,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 15,
//                               vertical: 23,
//                             ),
//                             child: MaterialButton(
//                               color: index + 1 == currentIndex
//                                   ? Colors.blue
//                                   : Color.fromARGB(255, 218, 218, 218),
//                               minWidth: 50,
//                               onPressed: () {
//                                 setState(() {
//                                   currentIndex = index + 1;
//                                 });
//                               },
//                               //padding: EdgeInsets.symmetric(horizontal: 2),
//                               child: Text(
//                                 "${index + 1}",
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     paginationButton(
//                       onTap: () {},
//                       title: 'Next',
//                     ),
//                   ],
//                 ),
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: newList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       child: Text("${newList[index].description}"),
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ElevatedButton paginationButton({VoidCallback? onTap, String? title}) {
//     return ElevatedButton(
//       onPressed: onTap,
//       child: Text(
//         "$title",
//         style: myStyle(
//           15,
//           Colors.white,
//         ),
//       ),
//     );
//   }
// }

// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/service/news_api_service.dart';
// import 'package:news_app/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_api/Model/news_model.dart';
import 'package:news_paper_api/Services/news_api_services.dart';
import 'package:news_paper_api/Widget/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> newsList = [];

  @override
  void didChangeDependencies() async {
    newsList = await NewsApiService().fetchNewsData();
    setState(() {});
    //print("rrrrrrrrrrrrrrr${newsList.length}");
    super.didChangeDependencies();
  }

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        centerTitle: true,
        title: Text(
          "News App",
          style: myStyle(18, Colors.black, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All News",
                style: myStyle(18, Colors.black, FontWeight.w700),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    paginationButton(onTap: () {}, title: "Prev"),
                    Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: MaterialButton(
                                  color: index + 1 == currentIndex
                                      ? Colors.blue
                                      : Colors.white12,
                                  minWidth: 30,
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = index + 1;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("${index + 1}"),
                                ),
                              );
                            })),
                    paginationButton(onTap: () {}, title: "Next"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            15.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Container(
                                    height: 120,
                                    width: 100,
                                    child: Image.network(
                                      "${newsList[index].urlToImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Text(
                                      "${newsList[index].author}",
                                    ),
                                    Text(
                                      "${newsList[index].title}",
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.lock_clock),
                                        Text(
                                          "${newsList[index].publishedAt}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 223, 222, 222),
                        ),
                        // child: Text("${newsList[index].title}"),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton paginationButton({VoidCallback? onTap, String? title}) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          "$title",
          style: myStyle(14, Colors.white),
        ));
  }
}
