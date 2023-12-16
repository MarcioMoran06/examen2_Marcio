import 'package:flutter_examen/providers/book_list_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookListProvider>(context, listen: false).fetchBooks());
  }
 @override
  Widget build(BuildContext context) {
    return Consumer<BookListProvider>(
      builder: (context, bookListProvider, child) {
        if (bookListProvider.books.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: bookListProvider.books.length,
          itemBuilder: (context, index) {
            final book = bookListProvider.books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.description),
              onTap: () {
              },
            );
          },
        );
      },
    );
  }
}