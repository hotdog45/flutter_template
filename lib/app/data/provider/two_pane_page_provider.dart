import 'package:get/get_connect/connect.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

const baseUrl = 'http://youapi';

class TwoPanePageProvider extends GetConnect {

  // Get request example
  Future<Response> getUser(int id) => get('$baseUrl/users/id');

  // Post request example
  Future<Response> postUser(Map data) => post('$baseUrl/users', data);

}