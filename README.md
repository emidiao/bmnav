# bmnav

A highly flexible Flutter implementation of the Bottom Navigation Bar. 

[![Pub](https://img.shields.io/pub/v/bmnav.svg)](https://pub.dartlang.org/packages/bmnav)
[![PayPal](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.me/edwnjos)

![Overview](https://raw.githubusercontent.com/edwnjos/bmnav/master/example/example.gif)

## Get Started

Add `bmanv` to your `pubspec.yaml` file:

```yaml
dependencies:
  bmnav: ^0.3.2
```

Import `bmnav` in your main.dart file:

```dart
import 'package:bmnav/bmnav.dart' as bmnav;
```

Implement `bmnav.BottomNav` in the `bottomNavigationBar` parameter in the Scaffold widget:

```dart
@override
Widget build(BuildContext ctx) {
	return Scaffold(
		appBar: AppBar(title: Text('Bottom Nav Demo')),
		body: Container(child: Text('Hello World')),
		bottomNavigationBar: bmnav.BottomNav(
			index: 0,
			onTap: (i) {},
			items: [
				bmnav.BottomNavItem(Icons.home),
				bmnav.BottomNavItem(Icons.fitness_center),
				bmnav.BottomNavItem(Icons.person),
				bmnav.BottomNavItem(Icons.view_headline)
			],
		),
	);
}
```

You can find a fully fledged example with navigation and custom styles [here](https://github.com/edwnjos/bmnav/blob/master/example/lib/main.dart).

## Support

If you found this project to be useful then please consider donating to help me continue maintaining this project and create new projects. :)

[![Paypal Donate Button](https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-150px.png)](https://www.paypal.me/edwnjos)

## Props

| Name              | Explanation                                | Default             |
|-------------------|--------------------------------------------|---------------------|
| index             | starting index                             | 0                   |
| onTap             | callback when a bottom nav item is pressed | null                |
| items             | bottom nav items                           | null                |
| elevation         | elevation of bottom nav                    | 8.0                 |
| showLabel         | shows or hides label                       | false               |
| showSelectedLabel | shows or hides label when icon selected    | false               |
| backgroundColor   | background color of bottom nav             | Colors.white        |
| color             | default icon color                         | md.Colors.grey[700] |
| selectedColor     | color of icon when selected                | md.Colors.blue      |
| iconSize          | default icon size                          | 24.0                |
| selectedIconSize  | size of the icon when selected             | 24.0                |


## Contributions

Feel free to contribute to this project.