import 'package:flutter/material.dart';

final String tableNotes = 'notes'; //notes is table name
final String tableTodayvists = 'todavisit';
final String tableTodayVists = 'visit';
final String tableCarProducts = 'carproducts';

// ToDay visits
class VisitFields {
  static final List<String> values = [
    // Add All Fieldes
    id, title
  ];
  static final String id = '_id';
  static final String title = 'title';
}

class Visit {
  final int? id;
  final String title;
  Visit({
    this.id,
    required this.title,
  });
  static Visit fromJsonVisit(Map<String, Object?> json) => Visit(
        id: json[VisitFields.id] as int?,
        title: json[VisitFields.title] as String,
      );

  Map<String, Object?> toJsonVisit() => {
        VisitFields.id: id,
        VisitFields.title: title,
      };

  Visit copyvisit({int? id, String? title}) => Visit(
        id: id ?? this.id,
        title: title ?? this.title,
      );
}

// ToDay visits With forgin Key
class TodayVisitFields {
  static final List<String> values = [
    // Add All Fieldes
    id, title, today_id
  ];
  static final String id = '_id';
  static final String title = 'title';
  static final String today_id = 'today_id';
}

class TodatVisit {
  final int? id;
  final String title;
  final int today_id;
  TodatVisit({
    this.id,
    required this.title,
    required this.today_id,
  });
  static TodatVisit fromJsonvisit(Map<String, dynamic?> json) => TodatVisit(
      id: json[TodayVisitFields.id] as int?,
      title: json[TodayVisitFields.title] as String,
      today_id: int.parse(json[TodayVisitFields.today_id] as String));

  Map<String, dynamic?> toJsonvisit() => {
        TodayVisitFields.id: id,
        TodayVisitFields.title: title,
        TodayVisitFields.today_id: today_id
      };

  TodatVisit CopyVisit({int? id, String? title, int? today_id}) => TodatVisit(
      id: id ?? this.id,
      title: title ?? this.title,
      today_id: today_id ?? this.today_id);
}

// Today List
class NotesField {
  static final List<String> values = [
    // Add All Fieldes
    id, title, date
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String date = 'date';
}

class Note {
  final int? id;
  final String title;
  final DateTime createdDate;

  Note({required this.title, this.id, required this.createdDate});

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NotesField.id] as int?,
        title: json[NotesField.title] as String,
        createdDate: DateTime.parse(json[NotesField.date] as String),
      );

  Map<String, Object?> toJson() => {
        NotesField.id: id,
        NotesField.title: title,
        NotesField.date: createdDate.toIso8601String(),
      };

  Note copy({int? id, String? title, DateTime? createdDate}) => Note(
        id: id ?? this.id,
        title: title ?? this.title,
        createdDate: createdDate ?? this.createdDate,
      );
}

// Car List
class CarProductField {
  static final List<String> values = [
    // Add All Fields
    id, title, price, count, imageUrl
  ];

  static  String id = '_id';
  static  String title = 'title';
  static  String count = 'count';
  static  String price = 'price';
  static  String imageUrl = 'ImageUrl';
}

class Car {
  final String id;
  final String title;
  final double price;
  final int count;
  final String imageUrl;
  final String line_discount_type = "fixed";

  Car({
    required this.id,
    required this.title,
    required this.count,
    required this.price,
    required this.imageUrl,
  });

  static Car fromJsonCar(Map<String, dynamic> json) => Car(
        id: json[CarProductField.id].toString(),
        title: json[CarProductField.title],
        count: int.parse(json[CarProductField.count]),
        price: double.parse(json[CarProductField.price]),
        imageUrl: json[CarProductField.imageUrl],
      );

  Map<String, dynamic> toJsonCar() => {
        CarProductField.id: id,
        CarProductField.title: title,
        CarProductField.price: price.toString(),
        CarProductField.count: count.toString(),
        CarProductField.imageUrl: imageUrl
      };

  Map<String, dynamic> toTransactionMap() {
    return {
      "product_id": id,
      "quantity": count,
      "quantity_returned": count,
      "unit_price_before_discount": price,
      "unit_price": price,
      "item_tax": 15,
      "line_discount_type": "fixed",
      "discount_id": 1,
      "variation_id": 2,
      "tax_id": 1,
    };
  }

  Car copyCar(
          {String? id,
          String? title,
          int? count,
          double? price,
          String? imageUrl}) =>
      Car(
          id: id ?? this.id,
          title:  this.title,
          price: price ?? this.price,
          count: count ?? this.count,
          imageUrl: imageUrl ?? this.imageUrl);
}
