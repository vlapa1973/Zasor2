//  работа над числом для вывода

float workNumber(float v) {
  if (int(v * 1000) % 10 >= 5) {
    v = int(v * 100 + 1) / 100.0;
  } else {
    v = int(v * 100) / 100.0;
  }
  return v;
}

//*****************************************************
//  Формирование отчета данных

String outReport() {
  table = loadTable(filePath + "base.csv", "header");
  String out = "";

  int sumN1 = 0;
  int sumN = 0;
  int sumChist = 0;
  int sumArenda = 0;
  int sumDopSor = 0;
  int sumSum = 0;

  String[] arrClients = {};
  for (TableRow row : table.rows()) {
    arrClients = append(arrClients, row.getString("client").toLowerCase());
    int n1 = row.getInt(9) - row.getInt(10) - row.getInt(12) + row.getInt(13);
    int n = row.getInt(9) - row.getInt(12) + row.getInt(17) / 2;
    int chist = int(row.getInt(9) - row.getInt(12) - (row.getInt(9) - row.getInt(12)) / 100.0 *
      row.getInt(7) - row.getInt(15) + row.getInt(17) / 2);
    int sum = chist * row.getInt(6) / 1000;

    sumN1 += n1;
    sumN += n;
    sumChist += chist;
    sumArenda += row.getInt(14);
    sumDopSor += row.getInt(15);
    sumSum += sum;
  }

  out += "\nВсего взвешиваний: " + table.getRowCount();
  out += "\n\nКам / ДС\n";
  out += workNumber(sumArenda / 1000.0) + " / " + workNumber(sumDopSor / 1000.0) + "\n\n";
  out += "% / з2 / %\n";
  out += workNumber((sumN - sumChist - sumDopSor) / float(sumN) * 100) + " / ";
  out += workNumber((sumN1 - sumN) / 1000.0) + " / ";
  out += workNumber((sumN1 - sumChist) / float(sumN1) * 100) + "\n\n";
  out += "Н1 / Н\n";
  out += workNumber(sumN1 / 1000.0) + " / " + workNumber(sumN / 1000.0) + "\n\n";
  out += "Ч / Сум / Средн\n";
  out += workNumber(sumChist / 1000.0) + " / " + workNumber(sumSum / 1000.0) + " / ";
  out += int(workNumber(float(sumSum) / sumChist * 1000)) + "\n\n";

  int sumKamazy = 0;
  int sumKamEach = 0;
  //boolean flagTemp = false;
  out += "---------------------\n\n";
  
  for (int k = 0; k < kamazy.length; ++k) {
    //if (kamazy[k].charAt(0) == '_' && !flagTemp) {
    //  out += "\n---------------------\nКамазы:  " + 
    //    workNumber(sumKamazy / 1000.0) + "т.\n\n";
    //  flagTemp = true;
    //}
    for (TableRow row : table.findRows(kamazy[k], "nomer")) {
      sumKamEach += row.getInt(9) - row.getInt(12) - int((row.getInt(9) -
        row.getInt(12)) / 100.0 * row.getInt(7)) - row.getInt(15) + row.getInt(17);
    }
    String j = "";
    if (kamazy[k].charAt(0) != '_' && sumKamEach == 0) {
      out += "";
    } else {
      if (sumKamEach  != 0) j += workNumber(sumKamEach / 1000.0);
      out += kamazy[k] + " - " + j + "\n";
    }
    if (kamazy[k].charAt(0) == '_') sumKamazy += sumKamEach;
    sumKamEach = 0;
  }
  out += "---------------------\nКамазы:  " + workNumber(sumKamazy / 1000.0) + " т.\n";
  out += "\n---------------------\n";

  String[] arrClientsUnic = {arrClients[0]};
  int countU = 0;
  for (int a = 0; a < arrClients.length; ++a) { 
    for (int r = 0; r < arrClientsUnic.length; ++r) {
      if (arrClients[a].equals(arrClientsUnic[r])) {
        countU = 0;
        break;
      } else {
        countU++;
      }
    }
    if (countU != 0) arrClientsUnic = append(arrClientsUnic, arrClients[a]);
  }
  arrClientsUnic = sort(arrClientsUnic);

  int sumClientEach = 0;
  int priceClient = 0;

  for (int k = 0; k < arrClientsUnic.length; ++k) {   
    for (TableRow row : table.findRows(arrClientsUnic[k], "client")) {
      sumClientEach += row.getInt(9) - row.getInt(12) - int((row.getInt(9) -
        row.getInt(12)) / 100.0 * row.getInt(7)) - row.getInt(15) + row.getInt(17);
        priceClient = row.getInt(6);
    }    
    if (sumClientEach == 0) {
      out += "";
    } else {
      out += workNumber(sumClientEach / 1000.0) + "  \t- " + priceClient / 1000.0 + "\t- " + arrClientsUnic[k] + "\n";
    }
    sumClientEach = 0;
  }
  return out;
}

//*****************************************************
