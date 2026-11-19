# Dart OOP Assignment: Kigali Bus Card

Name: Karlyn BOUKILA
Student ID: 23062

## My numbers

- D = 62, L = 2
- Starting balance = 1000 + (62 × 10) = 1620 RWF
- Bus fare = 200 + 62 = 262 RWF
- Student discount = 10 + 2 = 12%

## Output of main.dart

```text
Error: name too short
Owner: Karlyn | Balance: 1620 RWF
Owner: Karlyn BOUKILA | Balance: 1620 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 262 RWF
Paid 262 RWF
Owner: Karlyn BOUKILA | Balance: 3096 RWF
Student discount: 31 RWF
Paid 231 RWF
Owner: Karlyn BOUKILA | Balance: 1389 RWF
Student card: 12% off
```

## Part 1: Why no setter for balance?

There is no setter for balance because it would allow any part of the program to change the balance directly. For example, someone could write:

```dart
card.balance = 999999;
```

This would skip all the rules.

Without a setter, the balance can only change through `topUp()` and `pay()`. The `topUp()` method checks that the amount is between 500 and 50,000 RWF. The `pay()` method checks that the card has enough money before reducing the balance.

This keeps the balance safe and prevents it from being changed in a wrong way.

## Part 2: What does ~/ do?

`~/` is integer division. It divides two numbers and removes the decimal part.

For example:

```dart
print(237 * 17 / 100);
```

This prints:

```text
40.29
```

It uses normal division, so the result is a double.

```dart
print(237 * 17 ~/ 100);
```

This prints:

```text
40
```

It removes the decimal part and gives an integer.

## Part 4: Bug table

| Bug | The line | Why it is wrong | My fix |
|-----|----------|-----------------|--------|
| 1 | `String _brand;` and `int _battery;` | The fields have no starting values, so Dart gives an error because they cannot be null | I changed them to `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The parent constructor is not called, so the values from `Phone` are not set | I added `: super(brand, battery)` before the `{` |
| 3 | `@override` above `void restart()` | `@override` is used when a method replaces a method from the parent class, but `Phone` does not have `restart()` | I removed `@override` |
| 4 | `p.battery = 100;` | `battery` has a getter but no setter, so it cannot be changed from outside the class | I added a setter that only accepts a value from 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it should not use brackets | I changed it to `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | The word `new` is old style, but Dart still allows it | I did not change anything |

The output of the fixed `bug_hunt.dart` is:

```text
100
```

## Part 5

My prediction:

```text
1
5
```

For the normal bag, `a.add()` adds one item, so `items` becomes `1`.

Then `a.items = -5` is refused by the setter because `-5` is less than `0`. That is why it still prints `1`.

For `BigBag`, every call to `add()` calls `super.add()` twice. This means each call adds two items. After two calls, the bag has `4` items.

Then `b.items = b.items + 1` changes the number of items to `5`. The setter accepts this because `5` is not below `0`.

Real output:

```text
1
5
```

Was I right? Yes.

