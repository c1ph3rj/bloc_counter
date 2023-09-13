import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc_counter/productsdir/ApiReqeust/DummyApi.dart';

import './model/Product.dart';
import 'dart:async';

class ProductServiceRepo {
  Future<List<Product>> getAllProducts() async {
    final response = await ProductServiceApi.getAllProductsApi();
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<dynamic> productsObj = jsonResponse["products"];
      List<Product> products =
          productsObj.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception("Something went wrong!");
    }
  }
}
