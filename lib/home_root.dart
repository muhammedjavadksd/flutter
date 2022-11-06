  import 'package:flutter/material.dart';
  import 'package:flutter/src/widgets/container.dart';
  import 'package:flutter/src/widgets/framework.dart';
  import 'package:carousel_slider/carousel_slider.dart';
  import 'dart:convert';
  import 'package:http/http.dart' as http;

  class ScreenHomeRoot extends StatelessWidget {
    final carsousellist = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtO5M-cfDZd3BCoyOcR02jb1TmqPQKiRbLsw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB1xdA4lTJf6qcn6p5B6K6n6nvwZ9cEPgB1r1Y5leGCE_WtsChEE97GE6bz0sGrfTM3P4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRardkrQx9qxDTTFicv351hhEppIxOVG2iukT4-krOc676AHjvSYN8B7diXqrGdOSJHtCE&usqp=CAU"
    ];

    Future<List<ResponseDatum>> _getCategory() async {
      var data =
          await http.get(Uri.parse("https://aashaanco.com/my_api/category.php"));

      var jsons = jsonDecode(data.body)['responseData']; //json.decode(data.body);

      List<ResponseDatum> categoryListS = [];
      for (var u in jsons) {
        ResponseDatum category = ResponseDatum(
            categoryId: u["category_id"],
            categoryName: u["category_name"],
            image: u["image"]);

        categoryListS.add(category);
      }

      // print(categoryListS);
      return categoryListS;
    }

    Future<List<ProductResponse>> _getProduct() async {
      var product =
          await http.get(Uri.parse("https://aashaanco.com/my_api/product.php"));
      var product_json = jsonDecode(product.body)['responseData'];

      List<ProductResponse> productList = [];

      for (var p in product_json) {
        ProductResponse product = ProductResponse(
            name: p['name'],
            price: p['price'],
            image: p['image'],
            description: p['description']);
        productList.add(product);
      }

      return productList;
    }

    ScreenHomeRoot({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: SafeArea(
                child: Container(
              color: const Color(0xffF2f2f2),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/menu.png", width: 30),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/location.png",
                              width: 20,
                            ),
                            const Text(
                              "Kasaragod",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/notification.png",
                          width: 30,
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFf77951),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.settings,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              hintText: "Search Item",
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                        items: carsousellist.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "$i",
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "View all",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: FutureBuilder(
                            future: _getCategory(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.data == null) {
                                return CircularProgressIndicator(); //const Center(child: Text("Loading"))
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 175, 175, 175),
                                                width: 1)),
                                        height: 20,
                                        width: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.network(
                                              snapshot.data[index].image),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "New Arrival",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "View all",
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder(
                          future: _getProduct(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return Text("Wait Loading");
                            } else {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 130,
                                        minHeight: 200,
                                      ),
                                      width: 130,
                                      height: 220,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Image.network(
                                                  snapshot.data[index].image)),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  snapshot.data[index].name,
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )),
                                                Text(snapshot.data[index].price)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "All Product",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "View all",
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )),
                    ),
                  
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder(
                            future: _getProduct(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return CircularProgressIndicator(); //const Center(child: Text("Loading"))
                              } else {
                                return GridView.builder(
                                   shrinkWrap: true,
                                    scrollDirection: Axis.vertical, 
                                    itemCount: 4,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    (MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        4),
                                            mainAxisSpacing: 30,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Image.network(snapshot
                                                        .data![index].image)),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        snapshot
                                                            .data![index].name,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      )),
                                                      Text(snapshot
                                                          .data![index].price)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }))
                  ],
                ),
              ),
            )),
          ),
        ),
      );
    }
  }

  Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

  String welcomeToJson(Welcome data) => json.encode(data.toJson());

  class Welcome {
    Welcome({
      required this.responseData,
      required this.tablName,
    });

    List<ResponseDatum> responseData;
    String tablName;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
          responseData: List<ResponseDatum>.from(
              json["responseData"].map((x) => ResponseDatum.fromJson(x))),
          tablName: json["tablName"],
        );

    Map<String, dynamic> toJson() => {
          "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
          "tablName": tablName,
        };
  }

  class ResponseDatum {
    ResponseDatum({
      required this.categoryId,
      required this.categoryName,
      required this.image,
    });

    String categoryId;
    String categoryName;
    String image;

    factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
          categoryId: json["category_id"],
          categoryName: json["category_name"],
          image: json["image"],
        );

    Map<String, dynamic> toJson() => {
          "category_id": categoryId,
          "category_name": categoryName,
          "image": image,
        };
  }

  Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

  String pokedexToJson(Pokedex data) => json.encode(data.toJson());

  class Pokedex {
    Pokedex({
      required this.responseData,
      required this.tablName,
    });

    List<ResponseDatum> responseData;
    String tablName;

    factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
          responseData: List<ResponseDatum>.from(
              json["responseData"].map((x) => ResponseDatum.fromJson(x))),
          tablName: json["tablName"],
        );

    Map<String, dynamic> toJson() => {
          "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
          "tablName": tablName,
        };
  }

  class ProductResponse {
    ProductResponse({
      required this.name,
      required this.price,
      required this.image,
      required this.description,
    });

    String name;
    String price;
    String image;
    String description;

    factory ProductResponse.fromJson(Map<String, dynamic> json) =>
        ProductResponse(
          name: json["name"],
          price: json["price"],
          image: json["image"],
          description: json["description"],
        );

    Map<String, dynamic> toJson() => {
          "name": name,
          "price": price,
          "image": image,
          "description": description,
        };
  }
