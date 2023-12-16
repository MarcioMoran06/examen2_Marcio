import 'package:flutter_examen/models/respuesta.dart';
import 'package:flutter_examen/providers/repuesta_providers.dart';
import 'package:flutter/material.dart';

class BookListProvider with ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  
  List<Book> get books => _books;

  void fetchBooks() async {
    _books = await _bookService.getBooks();
    notifyListeners();
  }
}
