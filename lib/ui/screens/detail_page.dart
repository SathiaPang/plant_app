import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

class DetailPage extends StatefulWidget {
  final int plantId;

  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Plant> _plantList = Plant.plantList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CloseButton(context),
                EditButton(context),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            plantFeature: _plantList[widget.plantId].size,
                            title: 'Size',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PlantFeature(
                            plantFeature:
                                _plantList[widget.plantId].humidity.toString(),
                            title: 'Humidity',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PlantFeature(
                            plantFeature:
                                _plantList[widget.plantId].temperature,
                            title: 'Temperature',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .55,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector EditButton(BuildContext context) {
    List<Plant> _plantList = Plant.plantList;
    return GestureDetector(
      onTap: () {
        debugPrint('Favorite');
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Constants.primaryColor.withOpacity(.15),
        ),
        child: Icon(
          _plantList[widget.plantId].isFavorated == true
              ? Icons.favorite
              : Icons.favorite_border,
          color: Constants.primaryColor,
        ),
      ),
    );
  }

  GestureDetector CloseButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Constants.primaryColor.withOpacity(.15),
        ),
        child: Icon(
          Icons.close,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  //Adding the parament to the widget, meaning add hz, can take data mk yok mg.
  final String plantFeature;
  final String title;
  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor, fontSize: 16),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
