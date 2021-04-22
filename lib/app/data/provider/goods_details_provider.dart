import 'package:get/get_connect/connect.dart';


const baseUrl = 'http://youapi';

class GoodsDetailsProvider extends GetConnect {

  // Get request example
  Future<Response> getUser(int id) => get('$baseUrl/users/id');

  // Post request example
  Future<Response> postUser(Map data) => post('$baseUrl/users', data);

}