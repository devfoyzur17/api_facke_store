// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<String> productCategoryFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String productCategoryToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
