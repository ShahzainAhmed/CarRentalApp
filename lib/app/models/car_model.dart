import 'package:flutter/material.dart';
import 'package:mobile_app_with_api/app/data/constants/app_assets.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/models/car_details_model.dart';

class CarModel {
  final String title;
  final String subtitle;
  final String carMake;
  final String image;
  final Color color;
  List<CarDetailsModel> myCarDetailsList;

  CarModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.carMake,
    required this.myCarDetailsList,
  });
}

List myLargeTileList = [
  CarModel(
    title: 'Renault Clio',
    subtitle: '\$ 60 / day',
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
    subtitle: '\$ 55 / day',
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
    subtitle: '\$ 45 / day',
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
    subtitle: '\$ 80 / day',
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

List mySmallTileList = [
  CarModel(
    title: 'Volkswagen Polo',
    subtitle: '\$ 45 / day',
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
    subtitle: '\$ 80 / day',
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
    subtitle: '\$ 60 / day',
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
    subtitle: '\$ 55 / day',
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
