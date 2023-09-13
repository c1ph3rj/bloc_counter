import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class ProductServiceApi {
  static Future<http.Response> getAllProductsApi() async {
    final uri = Uri.parse("https://dummyjson.com/products");
    return await http.get(uri);
  }
}