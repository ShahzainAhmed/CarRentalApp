import 'package:flutter/material.dart';
import 'package:mobile_app_with_api/app/constants/app_assets.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/models/car_details_model.dart';

class CarModel {
  final String title;
  final String description;
  final String price;
  final String carMake;
  final String image;
  final Color color;
  List<CarDetailsModel> myCarDetailsList;

  CarModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.color,
    required this.carMake,
    required this.myCarDetailsList,
  });
}

List<CarModel> myLargeTileList = [
  CarModel(
    title: 'Renault Clio',
    description:
        'A stylish and compact hatchback that is easy to drive, fuel-efficient, and perfect for exploring the city or taking short trips.',
    price: '\$ 60 / day',
    image: AppAssets.kCar1,
    color: AppColors.kPrimaryColor,
    carMake: "Renault",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '2 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Automatic'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Peugeot 107',
    description:
        'A compact and economical city car with a simple, comfortable interior and excellent maneuverability for busy streets and everyday travel.',
    price: '\$ 55 / day',
    image: AppAssets.kCar4,
    color: AppColors.kPurpleColor,
    carMake: "Peugeot",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Manual'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Volkswagen Polo',
    description:
        'A reliable and practical hatchback offering a comfortable ride, responsive handling, and plenty of space for everyday city and highway journeys.',
    price: '\$ 45 / day',
    color: AppColors.kOrangeColor,
    image: AppAssets.kCar2,
    carMake: "Volkswagen",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Manual'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Audi A3',
    description:
        'A premium compact car combining elegant design, a comfortable interior, and smooth performance for a refined and enjoyable driving experience.',
    price: '\$ 80 / day',
    image: AppAssets.kCar3,
    color: AppColors.kGreyColor,
    carMake: "Audi",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Automatic'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
];

List<CarModel> mySmallTileList = [
  CarModel(
    title: 'Volkswagen Polo',
    description:
        'A reliable and practical hatchback offering a comfortable ride, responsive handling, and plenty of space for everyday city and highway journeys.',
    price: '\$ 45 / day',
    color: AppColors.kOrangeColor,
    image: AppAssets.kCar2,
    carMake: "Volkswagen",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Manual'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Audi A3',
    description:
        'A premium compact car combining elegant design, a comfortable interior, and smooth performance for a refined and enjoyable driving experience.',
    price: '\$ 80 / day',
    image: AppAssets.kCar3,
    color: AppColors.kGreyColor,
    carMake: "Audi",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Automatic'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Renault Clio',
    description:
        'A stylish and compact hatchback that is easy to drive, fuel-efficient, and perfect for exploring the city or taking short trips.',
    price: '\$ 60 / day',
    image: AppAssets.kCar1,
    color: AppColors.kPrimaryColor,
    carMake: "Renault",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '2 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Automatic'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
  CarModel(
    title: 'Peugeot 107',
    description:
        'A compact and economical city car with a simple, comfortable interior and excellent maneuverability for busy streets and everyday travel.',
    price: '\$ 55 / day',
    image: AppAssets.kCar4,
    color: AppColors.kPurpleColor,
    carMake: "Peugeot",
    myCarDetailsList: [
      CarDetailsModel(icon: AppAssets.kDetail3, text: '4 Seats'),
      CarDetailsModel(icon: AppAssets.kDetail2, text: '4 Doors'),
      CarDetailsModel(icon: AppAssets.kDetail1, text: 'Manual'),
      CarDetailsModel(icon: AppAssets.kDetail4, text: 'A/C'),
    ],
  ),
];
