import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggleButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggleValue() {
    setState(() {
      _value = !_value;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleValue,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 25,
        width: 45,
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: _value ? Colors.white : Colors.grey.shade300, // Track color
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _value ? Colors.orange : Colors.grey,
            width: 2,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: _value ? Colors.orange : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
