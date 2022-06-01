import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController textEditingController;

  const SearchBar({required this.textEditingController, Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: widget.textEditingController,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (vaule) {
          setState(() {});
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          filled: true,
          hintText: 'Search',
          contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          isDense: true,
          prefixIcon: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Icon(Icons.search, color: Colors.grey, size: 25)),
          suffixIcon: widget.textEditingController.text == ''
              ? null
              : Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.textEditingController.text = '';
                      });
                    },
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )),
        ),
      ),
    );
  }
}
