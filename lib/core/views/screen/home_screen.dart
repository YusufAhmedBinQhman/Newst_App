import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/model/news_model.dart';
import 'package:newst_app/core/view_model/news_article_vm.dart';
import 'package:newst_app/core/view_model/trendingVM.dart';
import 'package:newst_app/core/views/screen/sign_in_screen.dart';
import 'package:newst_app/core/views/widgets/category_widget.dart';
import 'package:newst_app/core/views/widgets/custom_container_home.dart';
import 'package:newst_app/core/views/widgets/top_news.dart';
import 'package:newst_app/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoryDetils = [
    "Top News",
    "Politics",
    "Tech",
    "Business",
    "Sports",
  ];
  int selected = 0;

  ///
  late Future<List<NewsArticleModel>> myNewsList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myNewsList = ApiService().fetchAllArticles();
  }

  ///
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // خلفية العنصر الأساسي
                Container(
                  height: 242,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(AppImageAsset.home1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Logo
                Positioned(
                  top: 70,
                  left: widthScreen / 2 - 70,
                  // right: 0,
                  child: Image.asset(AppImageAsset.logo),
                  width: 150,
                  // height: ,
                ),
                //trending
                Positioned(
                  top: 110,
                  left: 10,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // قائمة أفقية للـ CustomContainerHome
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0, // لضمان ملء عرض الحاوية
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: TrendingVM().trendingNews.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomContainerHome(
                          image:
                              "${TrendingVM().trendingNews[index].imageNews}",
                          titleNews:
                              "${TrendingVM().trendingNews[index].title}",
                          logoChannel:
                              "${TrendingVM().trendingNews[index].logoChannel}",
                          channelName:
                              "${TrendingVM().trendingNews[index].channelName}",
                          newsTime:
                              "${TrendingVM().trendingNews[index].newsTime}",
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            //category
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //category item
            Padding(
              padding: EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryDetils.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      nameCategory: "${categoryDetils[index]}",
                      isSelected: selected == index,
                      myOnTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            //Top News
            SizedBox(
              child: FutureBuilder(
                future: myNewsList,
                // initialData: InitialData,
                builder: (context, snapshot) {
                  // print("==============${snapshot.error}");
                  // print("==============${snapshot.data}");
                  // print("==============${snapshot.connectionState}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("حدث خطأ: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final myNewsSnapshot = snapshot.data![index];
                        return TopNewsWidget(
                          imageNews: myNewsSnapshot.imageUrl,
                          titleNews: myNewsSnapshot.title,
                          logoChannel: "assets/images/logo.png",
                          channelName: myNewsSnapshot.sourceName,
                          newsTime: myNewsSnapshot.publishedAt,
                        );
                      },
                    );
                  } else {
                    return Text("data");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            myNewsList = ApiService().fetchAllArticles();
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SignInScreen()),
          // );
        },
      ),
    );
  }
}
//     SizedBox(
            //   child: FutureBuilder(
            //     future: newsArticleVM.fetchTopHeadlines(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //       // حالة وجود خطأ أثناء تحميل البيانات
            //       if (snapshot.hasError) {
            //         return Center(child: Text("حدث خطأ أثناء جلب الأخبار!"));
            //       }
            //       final articles = snapshot.data;

            //       return ListView.builder(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: 50,
            //         itemBuilder: (context, index) {
            //           final article = articles[index];
            //           return TopNewsWidget(
            //             imageNews: article.imageUrl,
            //             titleNews: article.title,

            //             logoChannel: AppImageAsset.home1,

            //             channelName: article.sourceName,
            //             newsTime: "1111",
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
      