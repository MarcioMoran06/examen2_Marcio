import 'package:flutter/material.dart';
import 'package:flutter_examen/models/respuesta.dart'; 
import 'package:flutter_examen/services/get_book_answer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookService _bookService = BookService();
  late List<Book> _books;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    try {
      final books = await _bookService.getBooks();
      setState(() {
        _books = books.cast<Book>();
      });
    } catch (e) {
      print('Error loading books: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Libros'),
      ),
      body: _books == null
          ? Center(child: CircularProgressIndicator())
          : BookListWidget(books: _books),
    );
  }
}

class BookListWidget extends StatelessWidget {
  final List<Book> books;

  const BookListWidget({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(books[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsScreen(book: books[index]),
              ),
            );
          },
        );
      },
    );
  }
}

BookDetailsScreen({required Book book}) {
}
