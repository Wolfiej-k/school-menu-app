import 'dart:io';

final List<Menu> data = [
  Menu(Date.Monday, [
    MenuItem('Zucchini Carrot Breakfast Bread', 'assets/images/zucchini.jpg', vegetarian: true),
    MenuItem('New York Yogurt Choice', 'assets/images/yogurt.webp', vegetarian: true),
    MenuItem('Hot Oatmeal', 'assets/images/oatmeal.jpg', vegetarian: true),
    MenuItem('Seasonal Fresh Fruit', 'assets/images/seasonal.jpg', vegan: true)
  ]),
  Menu(Date.Tuesday, [
    MenuItem('Mini Blueberry Waffles', 'assets/images/waffles.jpg', vegetarian: true),
    MenuItem('Fresh Plums', 'assets/images/plum.jpg', vegan: true)
  ]),
  Menu(Date.Wednesday, [
    MenuItem('Banana Muffin', 'assets/images/muffin.jpg', vegetarian: true),
    MenuItem('Mozzarella Cheese Sticks', 'assets/images/mozzarella.webp', vegetarian: true),
    MenuItem('Fresh Oranges', 'assets/images/oranges.jpg', vegan: true)
  ]),
  Menu(Date.Thursday, [
    MenuItem('Buttermilk Pancakes', 'assets/images/pancakes.jpg', vegetarian: true),
    MenuItem('Turkey Sausage', 'assets/images/sausage.jpg'),
    MenuItem('Fresh Apples', 'assets/images/apples.jpg', vegan: true)
  ]),
  Menu(Date.Friday, [
    MenuItem('Assorted Fresh Bagels', 'assets/images/bagels.jpg', vegan: true),
    MenuItem('Cream Cheese', 'assets/images/cream.jpg', vegetarian: true),
    MenuItem('Jelly', 'assets/images/jelly.jpg', vegan: true),
    MenuItem('Fresh Pears', 'assets/images/pears.jpg', vegan: true)
  ])
];

class Menu {
  final Date day;
  final List<MenuItem> items;
  final int featured;

  Menu(this.day, [this.items = const [], this.featured = 0]);

  String getDay() {
    return day.str();
  }

  MenuItem getFeatured() {
    return items[featured];
  }
}

class MenuItem {
  late String label, image;
  late bool vegetarian, vegan;

  MenuItem(String label, String image, {bool? vegetarian, bool? vegan}) {
    this.label = label;
    this.image = image;
    this.vegan = vegan ?? false;
    this.vegetarian = (vegetarian ?? false) || this.vegan;
  }

  @override
  String toString() {
    if (vegan) return label + " (V)";
    if (vegetarian) return label + " (VE)";
    return label;
  }
}

enum Date { Monday, Tuesday, Wednesday, Thursday, Friday }

extension ParseToString on Date {
  String str() {
    return this.toString().split('.').last;
  }
}
