double division(double a, double b){
  if (b == 0){
    throw Exception("Division par 0!");
  }
  else{
    return a/b;
  }
}

double carrestotal(List<Object> liste){
  final List<Object> list1 = liste.whereType<int>();
  final int res = 0;

}

void main(){
  final double a = 1;
  final double b = 5;
  print(division(a, b));
}