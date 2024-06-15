import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;
  bool toggleIsFavorite(bool isFavorites) {
    return !isFavorites;
  }

  final List<String> _plantType = [
    '| About|',
    '| Warning|',
    '| Blog|',
    '| Privacy|',
    '| Contact|',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextField(
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Verdana',
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 5, right: 3),
                              hintText: 'Search for plants',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              height: 50,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantType[index],
                        style: TextStyle(
                          fontFamily: 'verdana',
                          fontSize: 13,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w400,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Product One
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(
                              plantId: _plantList[index].plantId,
                            ),
                            type: PageTransitionType.leftToRight),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorite(
                                        (_plantList[index].isFavorated));
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: _plantList[index].isFavorated == true
                                    ? Icon(
                                        Icons.favorite,
                                        color: Constants.primaryColor,
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                        color: Constants.primaryColor,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 1),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(222, 224, 230, 235),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                r'$ ' +
                                    _plantList[index]
                                        .price
                                        .toString()
                                        .englishNumber,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'Verdana'),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                      fontFamily: 'Arial',
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // New Plant - Text
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 18, bottom: 15, top: 20),
              child: const Text(
                'Available plants',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Product Two
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: size.height * 0.4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _plantList.length - 1,
                itemBuilder: (context, index) {
                  return NewPlantWidget(plantList: _plantList, index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
