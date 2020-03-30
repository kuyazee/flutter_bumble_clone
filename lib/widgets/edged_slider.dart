import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';

class EdgedSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChanged;

  EdgedSlider({
    this.min,
    this.max,
    this.value,
    this.onChanged,
  });

  double get _modifiedMin {
    return min - 2;
  }

  double get _modifiedMax {
    return max - 2;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Constants.bumbleYellow,
        inactiveTrackColor: Colors.grey,
        trackHeight: 2,
        thumbColor: Constants.bumbleYellow,
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        min: this._modifiedMin,
        max: this._modifiedMax,
        value: this.value,
        onChanged: (value) {
          if (value >= this.min && value <= this.max) {
            this.onChanged(value);
          }
        },
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
