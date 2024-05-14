import 'package:newsapp/app/data/constant/constant.dart';

String pathNameBuilder(String path) {
  return '$path&apiKey=$apiKey';
}

String formatDate(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
