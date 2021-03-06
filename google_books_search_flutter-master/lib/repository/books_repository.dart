import 'dart:html';

import 'package:google_books_api/models/book_case.dart';

class BooksRepository {
  Future<BookCase> getAvailableBooks(String query) async {
    // https://www.googleapis.com/books/v1/volumes?q=query
    // TODO: crear modelos antes
    // TODO: completar request y deserializacion

    final _uri = Uri(
      scheme: "https",
      host: "www.google.com",
      path: "",
      queryParameters: {"q" : query}
    );

    try {
      final response = await get(_uri.toString());
      if(response.statusCode == HttpStatus.ok) {
        var _responseAsJson = jsonDecode(response.body);
        BookCase bookCase = BookCase.fromJson(_responseAsJson);
        return bookCase;
      }
      else {
        throw "No respondio"
      }
    }
  }
}
