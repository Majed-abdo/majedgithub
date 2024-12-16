class information {
  String major;
  int price;
  //int gender=1;
  bool insurance = false;

  information(this.major, this.price);

  @override
  String toString() {
    return '$major Price: \$$price';
  }

  String getTotalPrice(){
    double totalPrice = price*1.0;
   // if (gender == 1){
    //  totalPrice += totalPrice *0.1;
  // }
  // else{
   //   totalPrice += totalPrice * 0.1;
   // }

    if(insurance){
      totalPrice+=500;
    }

    return totalPrice.toStringAsFixed(0);
  }
}

List<information> informations =[
  information('computer science',2000),
  information('biology', 1500),
  information('mechanical engineer',2500),
  information('finance',1700),
];