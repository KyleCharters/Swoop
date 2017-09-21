# wren-easing

[Easing functions](http://easings.net/) for Wren

```dart
import "easing" for Easing, bounce_out

for (i in 0..100) {
	System.print(Easing.lerp(i, 0, 100, 100, bounce_out))
}
```

##Supported Functions
 * `quad`
 * `cubic`
 * `quart`
 * `quint`
 * `sine`
 * `expo`
 * `circ`
 * `elastic`
 * `back`
 * `bounce`

`_in`, `_out`, `_inout`