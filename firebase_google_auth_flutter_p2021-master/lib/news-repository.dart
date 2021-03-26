import 'dart:convert';
import 'dart:io';

import 'package:google_login/consts.dart';
import 'package:http/http.dart';

import 'models/articles.dart';

class NewRepository {
  List<Articles>_noticiasList;

    static final NewRepository _NewRepository = NewRepository._internal();
    factory NewRepository(){
      return _NewRepository;
    }

    NewRepository._internal();
    Future<List<Articles>> getAvailableNoticias(String query) async {
    // https://www.googleapis.com/books/v1/volumes?q=query
    // TODO: crear modelos antes


    final _uri = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: 'v2/top-headlines',
      queryParameters: {"country": "mx", "category" : "sports", "apiKey" : API_KEY },
    );
    // TODO: completar request y deserializacion
    try{
      final response = await get(_uri);
      if(response.statusCode == HttpStatus.ok){
        List<dynamic> data = jsonDecode(response.body)["articles"];
        _noticiasList = ((data).map((element) => Articles.fromJson(element))).toList();
        return _noticiasList;
      }
      return [];

    } catch(e){
      //arroje un error
      throw "Ha ocurrido un error: $e";
    }
  }
}
