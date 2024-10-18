import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_for_route/model/products.dart';


class ApiManager {
  static Future<List<Products>>getProduct() async {
    Uri url = Uri.parse("https://dummyjson.com/products");
    Response response = await get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<Products> products = (jsonData['products'] as List)
        .map((productJson) => Products.fromJson(productJson))
        .toList();
    // Products products = Products.fromJson(jsonData);
    print("*******");
    print(jsonData);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return products; // Returning a List<Products>
    } else {
      throw Exception("Something went wrong: ${response.statusCode}");
    }
  }
}

