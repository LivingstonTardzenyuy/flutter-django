import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data_service/book_service.dart';

Future<void> init() async {
  Get.put(BookService());
  // Get.put(TapController());

}