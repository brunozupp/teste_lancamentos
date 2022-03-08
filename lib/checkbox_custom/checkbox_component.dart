import 'package:flutter/material.dart';

class CheckboxComponent extends StatefulWidget {

  final bool isChecked;
  final String description;
  final void Function(bool) onChanged;
  final EdgeInsets padding;
  final double spaceBetweenIconAndDescription;

  const CheckboxComponent({
    Key? key,
    required this.isChecked,
    required this.description,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.spaceBetweenIconAndDescription = 10
  }) : super(key: key);

  @override
  State<CheckboxComponent> createState() => _CheckboxComponentState();
}

class _CheckboxComponentState extends State<CheckboxComponent> {

  var value = false;

  @override
  void initState() {
    super.initState();

    value = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });

        widget.onChanged(value);
      },
      child: Padding(
        padding: widget.padding,
        child: Row(
          children: [
            _buildIcon(value),
            
            SizedBox(
              width: widget.spaceBetweenIconAndDescription,
            ),

            Expanded(
              child: Text(
                widget.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(bool value) {

    const size = 30.0;
    
    if(value) {
      return Icon(
        Icons.check_box,
        color: Colors.green[900],
        size: size,
      );
    }

    return const Icon(
      Icons.check_box_outline_blank,
      color: Colors.black,
      size: size,
    );
  }
}