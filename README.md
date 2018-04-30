# Swoop

[Easing functions](http://easings.net/) for Wren

```dart
import "swoop" for Bounce

for (i in 0..100) {
	System.print(Bounce.ease_in(i / 100))
}
```

##Supported Functions
 * `Quad`
 * `Cubic`
 * `Quart`
 * `Quint`
 * `Sine`
 * `Expo`
 * `Circ`
 * `Elastic`
 * `Back`
 * `Bounce`

`ease_in`, `ease_out`, `ease_inout`
