// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Slider extends StatefulWidget {
  const Slider({
    super.key,
    this.width,
    this.height,
    this.initMin,
    this.initmax,
    this.onMinChange,
    this.onMaxChange,
  });

  final double? width;
  final double? height;
  final int? initMin;
  final int? initmax;
  final Future Function(int? min)? onMinChange;
  final Future Function(int? max)? onMaxChange;

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    // Set initial range values based on provided or default values.
    _rangeValues = RangeValues(
      (widget.initMin ?? 25).toDouble(),
      (widget.initmax ?? 75).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.0,
      alignment: Alignment.center,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 4.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        ),
        child: RangeSlider(
          values: _rangeValues,
          min: 0,
          max: 100,
          divisions: 100,
          onChanged: (RangeValues newValues) {
            setState(() {
              _rangeValues = newValues;
            });
          },
          onChangeEnd: (RangeValues newValues) async {
            // Update the range values and invoke the callbacks.
            setState(() {
              _rangeValues = newValues;
            });

            if (widget.onMinChange != null) {
              await widget.onMinChange!(newValues.start.toInt());
            }
            if (widget.onMaxChange != null) {
              await widget.onMaxChange!(newValues.end.toInt());
            }
          },
        ),
      ),
    );
  }
}
