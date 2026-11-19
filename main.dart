// Student: Karlyn BOUKILA
// Reg no: 23062

class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter for owner
  String get owner {
    return _owner;
  }

  // Getter for balance
  int get balance {
    return _balance;
  }

  // Setter for owner
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // Shows the card details
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // Adds money to the card
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance += amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // Pays for a bus trip
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

  // Constructor
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // Shows student card details
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // Pays with a student discount
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

  // Testing the owner setter
  BusCard card = BusCard('Karlyn', 1620);
  card.owner = 'KB';
  card.showInfo();

  // Changing the owner to a valid name
  card.owner = 'Karlyn BOUKILA';
  card.showInfo();

  // Testing top-up
  card.topUp(100);
  card.topUp(2000);

  // Paying for two trips
  card.pay(262);
  card.pay(262);
  card.showInfo();

  // Creating a student card
  StudentCard student = StudentCard('Karlyn BOUKILA', 1620, 12);

  // Paying with the student discount
  student.pay(262);
  student.showInfo();
}

   
 


 
