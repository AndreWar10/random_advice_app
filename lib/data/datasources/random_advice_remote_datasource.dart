import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/api.dart';
import '../../utils/server_exception.dart';
import '../models/random_advice_model.dart';

abstract class RandomAdviceRemoteDataSource {
  Future<RandomAdviceModel> getAdvice();
}

class RandomAdviceRemoteDataSourceImpl implements RandomAdviceRemoteDataSource {
  final http.Client client;
  RandomAdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<RandomAdviceModel> getAdvice() async {
    var response = await client.get(
      Uri.parse(API.randomAdvice),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);

      return RandomAdviceModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
