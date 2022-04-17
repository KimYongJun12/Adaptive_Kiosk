import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final bool isHot;

  Product({
    this.image,
    this.title,
    this.price,
    this.isHot
  });
}

List<Product> coffees = [
  Product(
      title: "아메리카노1",
      price: 111,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노2",
      price: 222,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노3",
      price: 333,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노4",
      price: 444,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노5",
      price: 555,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노6",
      price: 666,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노7",
      price: 777,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노8",
      price: 888,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아메리카노9",
      price: 999,
      image: "assets/images/coffee/americano.jpg",
      isHot: true
  ),
  Product(
      title: "아이스아메리카노1",
      price: 1000,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노2",
      price: 1111,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노3",
      price: 2222,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노4",
      price: 3333,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노5",
      price: 4444,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노6",
      price: 5555,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
  Product(
      title: "아이스아메리카노7",
      price: 6666,
      image: "assets/images/coffee/americano.jpg",
      isHot: false
  ),
];

List<Product> adeNjuices = [
  Product(
      title: "메가에이드1",
      price: 11,
      image: "assets/images/adeNjuice/megaade.jpg",
      isHot: false
  ),
  Product(
      title: "메가에이드2",
      price: 22,
      image: "assets/images/adeNjuice/megaade.jpg",
      isHot: false
  ),
  Product(
      title: "메가에이드3",
      price: 33,
      image: "assets/images/adeNjuice/megaade.jpg",
      isHot: false
  ),
  Product(
      title: "메가에이드4",
      price: 44,
      image: "assets/images/adeNjuice/megaade.jpg",
      isHot: false
  ),
  Product(
      title: "메가에이드5",
      price: 55,
      image: "assets/images/adeNjuice/megaade.jpg",
      isHot: false
  ),
  Product(
      title: "유니콘매직에이드(핑크)1",
      price: 66,
      image: "assets/images/adeNjuice/unicornmagicade.jpg",
      isHot: false
  ),
  Product(
      title: "유니콘매직에이드(핑크)2",
      price: 77,
      image: "assets/images/adeNjuice/unicornmagicade.jpg",
      isHot: false
  ),
  Product(
      title: "유니콘매직에이드(핑크)3",
      price: 88,
      image: "assets/images/adeNjuice/unicornmagicade.jpg",
      isHot: false
  ),
  Product(
      title: "유니콘매직에이드(핑크)4",
      price: 99,
      image: "assets/images/adeNjuice/unicornmagicade.jpg",
      isHot: false
  ),
  Product(
      title: "유니콘매직에이드(핑크)5",
      price: 100,
      image: "assets/images/adeNjuice/unicornmagicade.jpg",
      isHot: false
  ),
];

List<Product> beverages = [
  Product(
      title: "아이스고구마라떼1",
      price: 1,
      image: "assets/images/beverage/icesweetpotatolatte.JPG",
      isHot: false
  ),
  Product(
      title: "아이스고구마라떼2",
      price: 2,
      image: "assets/images/beverage/icesweetpotatolatte.JPG",
      isHot: false
  ),
  Product(
      title: "아이스고구마라떼3",
      price: 3,
      image: "assets/images/beverage/icesweetpotatolatte.JPG",
      isHot: false
  ),
  Product(
      title: "고구마라떼1",
      price: 4,
      image: "assets/images/beverage/hotsweetpotatolatte.jpg",
      isHot: true
  ),
  Product(
      title: "고구마라떼2",
      price: 5,
      image: "assets/images/beverage/hotsweetpotatolatte.jpg",
      isHot: true
  ),
  Product(
      title: "고구마라떼3",
      price: 6,
      image: "assets/images/beverage/hotsweetpotatolatte.jpg",
      isHot: true
  ),
];

List<Product> smoothies = [
  Product(
      title: "쿠키프라페1",
      price: 999,
      image: "assets/images/smoothie/cookiefrappe.JPG",
      isHot: false
  ),
  Product(
      title: "쿠키프라페2",
      price: 888,
      image: "assets/images/smoothie/cookiefrappe.JPG",
      isHot: false
  ),
  Product(
      title: "쿠키프라페3",
      price: 777,
      image: "assets/images/smoothie/cookiefrappe.JPG",
      isHot: false
  ),
  Product(
      title: "쿠키프라페4",
      price: 666,
      image: "assets/images/smoothie/cookiefrappe.JPG",
      isHot: false
  ),
];

List<Product> teas = [
  Product(
      title: "녹차1",
      price: 10,
      image: "assets/images/tea/hotgreentea.JPG",
      isHot: true
  ),
  Product(
      title: "아이스녹차1",
      price: 10,
      image: "assets/images/tea/icegreentea.JPG",
      isHot: false
  ),
  Product(
      title: "녹차2",
      price: 20,
      image: "assets/images/tea/hotgreentea.JPG",
      isHot: true
  ),
  Product(
      title: "아이스녹차2",
      price: 20,
      image: "assets/images/tea/icegreentea.JPG",
      isHot: false
  ),
  Product(
      title: "녹차3",
      price: 30,
      image: "assets/images/tea/hotgreentea.JPG",
      isHot: true
  ),
  Product(
      title: "아이스녹차3",
      price: 30,
      image: "assets/images/tea/icegreentea.JPG",
      isHot: false
  ),
];