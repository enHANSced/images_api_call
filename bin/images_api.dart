import 'package:http/http.dart' as http;

import 'package:images_api/types/image.dart';


void main(List<String> args) async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/photos');
  try {
    var response = await fetchData(url);
    if (response.statusCode == 200) {
      final images = imageFromJson(response.body);
      print("\n📥 Recibiendo imagenes...");
      await Future.delayed(Duration(seconds: 2));
      print('🖼️ Imagenes recibidas: ${images.length}\n');
      await Future.delayed(Duration(seconds: 1));
      displayImages(images);
    } else {
      print('🚫 Error: ${response.statusCode}');
    }
  } catch (exception) {
    print('⚠️ Excepcion: ${exception.toString()}');
  }
}

Future<http.Response> fetchData(Uri url) async {
  return await http.get(url);
}

void displayImages(List<Image> images) {
   const bold = '\x1B[1m'; // ANSI escape code for bold text

  for (var image in images) {
    print('🆔$bold ID: ${image.id}, 📝 TITULO: ${image.title},\n🔗 URL: ${image.url}');
    print('--------------------------------------');
  }
}