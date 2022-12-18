import 'package:coding_cubit/network/api.dart';
import 'package:coding_cubit/response/res_get_products.dart';
import 'package:dio/dio.dart';

class RepoProducts {
  Future<ResGetProducts?> getProducts() async {
    try {
      Response response = await Dio().get(Api.baseUrl);
      return ResGetProducts.fromJson(response.data);
    } catch (e) {}

    return null;
  }
}
