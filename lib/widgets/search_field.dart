import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;

  const SearchField({Key? key, this.controller}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      controller: widget.controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: Colors.white.withOpacity(.2),
        prefixIcon: Image.asset("assets/icons/search.png"),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      onSubmitted: (String searchTerm) {
        Navigator.of(context).pushNamed(
          '/search_page',
          arguments: searchTerm,
        );
      },
    );
  }
}
