# Dart OOP Assignment: Kigali Bus Card

**Name:** PRENOM NOM
**Student ID:** 23062

## My numbers
- D = 62, L = 2
- Starting balance = 1000 + (62 × 10) = 1620 RWF
- Bus fare = 200 + 62 = 262 RWF
- Student discount = 10 + 2 = 12%

## Output of main.dart
```
Error: name too short
Owner: PRENOM | Balance: 1620 RWF
Owner: PRENOM NOM | Balance: 1620 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 262 RWF
Paid 262 RWF
Owner: PRENOM NOM | Balance: 3096 RWF
Student discount: 31 RWF
Paid 231 RWF
Owner: PRENOM NOM | Balance: 1389 RWF
Student card: 12% off
```

## Part 1: Why no setter for balance?
A setter would let any code write `card.balance = 999999` and skip all the rules. Without it, the balance can only change through `topUp` (which checks the amount is 500 to 50000) and `pay` (which refuses a fare bigger than the balance). The balance stays safe and can never be faked or made negative.

## Part 2: What does ~/ do?
`~/` is integer division: it divides and throws away the decimals.
- `print(237 * 17 / 100);` prints `40.29` (normal division, gives a double)
- `print(237 * 17 ~/ 100);` prints `40` (the decimal part is cut, gives an int)

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` | Fields cannot be empty (null) in Dart, so they need a starting value | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The parent Phone is not built, because the constructor does not call `super` | Add `: super(brand, battery)` before `{` |
| 3 | `@override` above `void restart()` | `@override` only works if the parent has that method, and Phone has no `restart` | Remove `@override` |
| 4 | `p.battery = 100;` | `battery` has a getter but no setter, so it cannot be changed | Add `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it is used without `()` | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | The word `new` is old style but still allowed in Dart, so this line works | (none) |

Output of the fixed `bug_hunt.dart`: `100`

## Part 5
My prediction:
```
1
5
```
Why: `a.add()` makes items 1, and `a.items = -5` is refused by the setter (-5 is below 0), so it prints 1.
For `BigBag`, each `add()` calls `super.add()` twice, so it adds 2. Two calls give 4. Then `b.items = b.items + 1` gives 5, which the setter accepts, so it prints 5.

Real output:
```
1
5
```
Was I right? Yes.
