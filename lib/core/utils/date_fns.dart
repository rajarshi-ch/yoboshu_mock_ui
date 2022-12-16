

import 'package:intl/intl.dart';

final f = DateFormat('dd/MM/yyyy');

String getFormattedDate( DateTime date){

  return f.format(date);
}

DateTime parseDateString ( String date ){
  return f.parse(date);
}
