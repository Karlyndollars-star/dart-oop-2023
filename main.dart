class BusCard {
  String _owner = '';
  int _balance = 0;

  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  String get owner {
    return _owner;
  }

  // Getter for balance
  int get balance {
    return _balance;
  }

  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance += amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance -= fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;

    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 62, L = 2
  // Starting balance = 1620 RWF
  // Bus fare = 262 RWF
  // Discount = 12%

  BusCard card = BusCard('Karlyn', 1620);
  card.owner = 'KB';
  card.showInfo();

  card.owner = 'Karlyn BOUKILA';
  card.showInfo();

  card.topUp(100);
  card.topUp(2000);

  card.pay(262);
  card.pay(262);
  card.showInfo();

  StudentCard student = StudentCard('Karlyn BOUKILA', 1620, 12);

  student.pay(262);
  student.showInfo();
}

   
 


 
