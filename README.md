# MouseWheelDetector
OSX Flutter Mouse Wheel GestureDetector

Example :
```Dart
   child: MouseWheelDetector(
              //鼠标滚轮事件处理
              onIncrease: () {
                double volume = _.volume.volume;
                volume++;
                if (volume > 0) volume = 0;
                _.setVolume(volume);
              },
              onDecrease: () {
                double volume = _.volume.volume;
                volume--;
                if (volume < -120) volume = -120;
                _.setVolume(volume);
              },
              child: Slider(
                value: _.volume.volume,
                divisions: 240,
                min: -120,
                max: 0,
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.grey,
                onChanged: (val) => {
                  _.setVolume(val),
                },
              ),
```

or use builder

```Dart
Builder(
              builder: (context) {
                NumberControl child = NumberControl(
                  numText: item.value,
                  start: 0.4,
                  end: 128,
                  updateValueChanged: (val) {
                    setValue(val);
                  },
                );
                return MouseWheelDetector(
                  onIncrease: () => child.performUp(),
                  onDecrease: () => child.performDown(),
                  mouseWheelDirection: MouseWheelDirection.verticle,
                  child: child,
                );
              },

```
