import 'package:flutter/material.dart';

class DroCounterWidget extends StatefulWidget {
  final Function(int) onChanged;
  const DroCounterWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DroCounterWidget> createState() => _DroCounterWidgetState();
}

class _DroCounterWidgetState extends State<DroCounterWidget> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(130, 130, 130, 0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: const Text(
              "-",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            onTap: () {
              if (_counter > 1) {
                setState(() {
                  _counter = _counter - 1;
                });
                widget.onChanged(_counter);
              } 
              return;
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                _counter.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          InkWell(
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            onTap: () {
              if (_counter >= 1) {
                setState(() {
                  _counter = _counter + 1;
                });
                widget.onChanged(_counter);
              } 
              return;
            },
          ),
        ],
      ),
    );
  }
}
