import '../main.dart';

error(Object e){
  logger.e("An Exception Occurred : ", error: e);
}

printS(String s){
  logger.d("System.Out: $s");
}