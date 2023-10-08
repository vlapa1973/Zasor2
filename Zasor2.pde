//*******************************************************************
//  Zasor2
//  2020.09.21 - 2021.09.05
//  v.  1064
//*******************************************************************
import processing.serial.*;

//PFont myFont;

Serial myPort;                     //  The serial portSerial myPort;
int lf;                            //  кол-во знаков в посылке с весов
int serialPort;                    //  порядковый номер Serial порта
int portSpeed;                     //  скорость Serial порта
int beginIn;                       //  начало данных в посылке с весов
String vIn;                        //  начало посылки с весов (текст)
String vOut;                       //  конец посылки с весов (текст)
String vOff;                       //  весы выключены (текст)
String filePath;                   //  путь для сохранения файла
int threshold;                     //  порог веса
int stab;                          //  кол-во повторяющихся данных с весов
int tara;                          //  тара а/м для %
int protsUmolch;                   //  % по умолчанию
int numberReport;                  //  номер отчета в году (месяце и тд)

int data = 0;                      //  данные с весов
int dataTemp = 0;
String time, timeArh, timeMonth, timeDate, timeExc, timeReport;
String inputData = "";
boolean flagTablo = false;
boolean flagProts = false;
int place = 0;
int input = 0;
int stabTemp = 0;
boolean flagStab = false;
boolean flagWeight = true;
boolean flagVzw = false;
int dataCorProts = 0;
int dataTablo = 0;
int onTime = 0;
int click = 500;
boolean flagButOn = false;

String put = "data/Custom/";            //  путь для сохранения файла настроек
PrintWriter outputCrash;               // объект output (для файла)

int fillet = 5;                        //  скругление
int[] visTablo = {10, 10, 220, 80};
int[] visVzw = {240, 15, 147, 70};

int[] visZas2 = {10, 110, 220, 30};
int[] visNom = {10, 145, 220, 30};
int[] visCl = {10, 180, 220, 30};
int[] visObj = {10, 215, 220, 30};
int[] visDopN = {10, 250, 382, 30};

int[] visPrice = {235, 110, 157, 30};
int[] visProts = {235, 145, 157, 30};
int[] visAren = {235, 180, 157, 30};
int[] visDopS = {235, 215, 157, 30};

int[] visClean = {20, 290, 40, 40};
int[] visVes = {80, 290, 180, 40};
int[] visOk = {270, 290, 112, 40};
int[] visVzw1 = {10, 355, 382, 25};

int[] menu = {235, 15, 157, 497};
int offsetMenu = 25;
int inputMenu = 0;
int visMenu = 0;
boolean flagMenu = false;

boolean flagConfirm = false;

String[] kamazy;
String[] clients;

int m1 = 6;                            //  кол-во первых взвешиваний
int m2 = 15;                           //  кол-во данных о первых взвешиваниях (номер, вес, корр)
String[][] dataM1 = new String[m1][m2];
String[] dataM2 = new String[m2];
String[] inData = new String[m2];
int vis = 0;

Table table;
boolean flagOpen = false;

//*****************************************************
void setup() {
  //myFont = createFont("Arial", 12);
  //textFont(myFont);
  printArray(Serial.list());
  loadSetup();
  size(403, 542);
  try {
    myPort = new Serial(this, Serial.list()[serialPort], portSpeed);
    myPort.bufferUntil(lf);
    myPort.write(vOff);
  }
  catch (Exception e) {
    TimeString();
    String[] lines = {timeExc + "   COMport = " + serialPort
      + " - does not exist"};
    saveStrings(filePath + "log_COMport.txt", lines);

    strokeWeight(3);
    fill(#CFCFCF);
    rect(4, 3, 394, 338, fillet);
    rect(4, 348, 394, 188, fillet);
    fill(255, 0, 0);
    textSize(24);
    text("COM ( " + serialPort + " ) НЕ НАЙДЕН !", 60, 158);

    stop();
    //exit();
  }
}
//*****************************************************
void draw() {
  background(#CFCFCF);
  if (flagOpen) {
    visible();
    if (flagTablo && flagWeight) tabloVisible();
  } else {
    visible2();
    if (flagWeight) tabloVisible();
  }
}

//*****************************************************
//  данные с Serial
void serialEvent(Serial p) {
  data = int(p.readString().substring(beginIn, beginIn + 6));
  if (data != dataTemp) {
    dataTemp = data;
    stabTemp = 0;
    flagStab = false;
  } else {
    stabTemp++;
    if (stabTemp == stab) {
      flagStab = true;
      stabTemp = 0;
    }
  }
  if (data > threshold) {
    if (flagProts && data > tara + 1000) {
      dataTablo = data + (data - tara) / 100 * int(inData[1]) / 10 * 10;
      dataCorProts = (data - tara) / 100 * int(inData[1]) / 10 * 10;
    } else {
      dataTablo = data + int(inData[1]);
      dataCorProts = int(inData[1]);
    }
  } else {
    dataTablo = data;
  }
  flagWeight = true;
}

//*****************************************************
//  запись файла настроек
void writeSetup() {
  JSONArray values;
  values = new JSONArray();
  JSONObject animal = new JSONObject();
  animal.setInt("COMport", serialPort);
  animal.setInt("portSpeed", portSpeed);
  animal.setInt("numberScales", lf);
  animal.setInt("beginIn", beginIn);
  animal.setString("scalesIn", vIn);
  animal.setString("scalesOut", vOut);
  animal.setString("scalesOff", vOff);
  animal.setString("filePath", filePath);
  animal.setInt("threshold", threshold);
  animal.setInt("stabWeight", stab);
  animal.setInt("tara", tara);
  animal.setInt("protsUmolch", protsUmolch);
  animal.setInt("numberReport", numberReport);

  values.setJSONObject(0, animal);
  saveJSONArray(values, put + "option.json");
  saveJSONArray(values, filePath + "option.json");
}
//*****************************************************
//  вывод времени
void TimeString() {
  String D = "";
  String H = "";
  String M = "";
  String S = "";
  String Y = "";
  String N = "";
  Y += year();
  N += (month() < 10) ? "0" + month() : month();
  D += (day() < 10) ? "0" + day() : day();
  H += (hour() < 10) ? "0" + hour() : hour();
  M += (minute() < 10) ? "0" + minute() : minute();
  S += (second() < 10) ? "0" + second() : second();
  time = H + ":" + M + ":" + S;
  timeArh = H + M + S;
  timeMonth = N;
  timeDate = D;
  timeExc = D + "_" + H + ":" + M + ":" + S;
  timeReport = Y + N + "_" + D;
}

//****************************************************
// обработчик inputData
void workInputData() {
  if (place == 1 && !flagProts) {
    inData[1] = "";
    inData[1] += int(inputData) / 10 * 10;
  } else
    if (place == 5) {
      inData[5] = "";
      inData[5] += int(inputData) / 100 * 100;
    } else if (place == 5) {
      inData[5] = "";
      inData[5] += int(inputData) / 100 * 100;
    } else if (place == 6) {
      inData[6] = "";
      inData[6] += int(inputData);
    } else if (place == 7) {
      inData[7] = "";
      inData[7] += int(inputData) / 10 * 10;
    } else if (place == 8) {
      inData[8] = "";
      inData[8] += int(inputData) / 10 * 10;
    } else if (place == 11) {
      inData[11] = "";
      inData[11] += int(inputData) / 10 * 10;
    } else if (place != 0) inData[place] = inputData;
}

//****************************************************
//
void dataIn(int a) {
  //TimeString();
  inData[0] = "";
  //inData[1] = "";
  inData[2] = dataM1[a-1][2];
  inData[3] = dataM1[a-1][3];
  inData[4] = dataM1[a-1][4];
  inData[5] = dataM1[a-1][5];
  inData[6] = dataM1[a-1][6];
  inData[7] = dataM1[a-1][7];
  inData[8] = dataM1[a-1][8];
  inData[9] = dataM1[a-1][9];
  inData[12] = dataM1[a-1][10];
  inData[11] = dataM1[a-1][11];

  //time = "";
}

//*****************************************************
//  вывод веса на табло
void tabloVisible() {
  String temp = "";
  temp += vIn + nf(dataTablo, 5) + vOut;
  myPort.write(temp);
  flagWeight = false;
  println(temp + "\t" + int(inData[1]) + "\t" + place + "\t" +
    inputData + "\t" + numberReport);
}
//*****************************************************
//  запись данных 1 взвешивания
void saveData1() {
  TimeString();
  if (vis == 0) {
    for (int k = m1 - 1; k > 0; --k) {
      for (int n = 0; n < m2; ++n) {
        dataM1[k][n] = dataM1[k - 1][n];
      }
    }
    dataM1[0][0] = inData[0];
    if (flagProts) {
      dataM1[0][1] = "";
      dataM1[0][1] += dataCorProts;
    } else {
      dataM1[0][1] = inData[1];
    }
    dataM1[0][2] = inData[2];
    dataM1[0][3] = inData[3];
    dataM1[0][4] = inData[4];
    dataM1[0][5] = inData[5];
    dataM1[0][6] = inData[6];
    dataM1[0][7] = inData[7];
    dataM1[0][8] = inData[8];
    dataM1[0][9] = inData[9];
    dataM1[0][10] = inData[10];
    dataM1[0][11] = inData[11];
    vis = 0;
    place = 0;

    JSONArray values;
    values = new JSONArray();
    for (int a = 0; a < m1; ++a) {
      JSONObject animal = new JSONObject();
      animal.setInt("id", a);
      animal.setInt("zas2", int(dataM1[a][1]));
      animal.setString("nomer", dataM1[a][2]);
      animal.setString("client", dataM1[a][3]);
      animal.setString("object", dataM1[a][4]);
      animal.setInt("price", int(dataM1[a][5]));
      animal.setInt("prots", int(dataM1[a][6]));
      animal.setInt("arenda", int(dataM1[a][7]));
      animal.setInt("dopsor", int(dataM1[a][8]));
      animal.setString("note", dataM1[a][9]);
      animal.setInt("ves", int(dataM1[a][0]));
      animal.setInt("1/2", int(dataM1[a][11]));
      animal.setString("time", dataM1[a][10]);
      values.setJSONObject(a, animal);
    }
    saveJSONArray(values, put + "temp.json");
    saveJSONArray(values, filePath + "temp.json");
    time = "";
  }
}
//****************************************************
//  запись данных 2 взвешивания
void saveData2() {
  TimeString();

  dataM2[0] = dataM1[vis-1][0];
  dataM2[1] = dataM1[vis-1][1];
  dataM2[2] = inData[2];
  dataM2[3] = inData[3];
  dataM2[4] = inData[4];
  dataM2[5] = inData[5];
  dataM2[6] = inData[6];
  dataM2[7] = inData[7];
  dataM2[8] = inData[8];
  dataM2[9] = inData[9];
  dataM2[10] = time;        //  dataM1[vis-1][10];
  dataM2[11] = inData[0];
  dataM2[12] = inData[11];

  if (flagProts) {
    dataM2[13] = "";
    dataM2[13] += dataCorProts;
  } else {
    dataM2[13] = inData[1];
  }

  dataSave2next();
  dataSave2next2();
}
//****************************************************
void dataSave2next() {
  for (int k = vis-1; k < m1-1; ++k) {
    for (int n = 0; n < m2; ++n) {
      dataM1[k][n] = dataM1[k+1][n];
    }
  }
  for (int i = 0; i < m2; ++i) {
    dataM1[m1-1][i] = "";
  }
  vis = 0;

  JSONArray values;
  values = new JSONArray();
  for (int a = 0; a < m1; ++a) {
    JSONObject animal = new JSONObject();
    //animal.setInt("id_R", numberReport);
    animal.setInt("id", a);
    animal.setInt("zas2", int(dataM1[a][1]));
    animal.setString("nomer", dataM1[a][2]);
    animal.setString("client", dataM1[a][3]);
    animal.setString("object", dataM1[a][4]);
    animal.setInt("price", int(dataM1[a][5]));
    animal.setInt("prots", int(dataM1[a][6]));
    animal.setInt("arenda", int(dataM1[a][7]));
    animal.setInt("dopsor", int(dataM1[a][8]));
    animal.setString("note", dataM1[a][9]);
    animal.setInt("ves", int(dataM1[a][0]));
    animal.setString("time", dataM1[a][10]);
    animal.setInt("1/2", int(dataM1[a][11]));
    values.setJSONObject(a, animal);
  }
  saveJSONArray(values, put + "temp.json");
  saveJSONArray(values, filePath + "temp.json");
}
//****************************************************
void dataSave2next2() {
  table = loadTable(filePath + "base.csv", "header");

  TableRow newRow = table.addRow();
  //newRow.setInt("id_R", numberReport);
  newRow.setInt("date", int(timeDate));
  newRow.setInt("id", table.getRowCount());
  newRow.setString("nomer", dataM2[2]);
  newRow.setString("client", dataM2[3].toLowerCase());
  newRow.setString("object", dataM2[4]);
  newRow.setInt("price", int(dataM2[5]));
  newRow.setInt("prots", int(dataM2[6]));
  newRow.setString("time1", inData[12]);
  newRow.setInt("ves1", int(dataM2[0]));
  newRow.setInt("cor1", int(dataM2[1]));
  newRow.setString("time2", dataM2[10]);
  newRow.setInt("ves2", int(dataM2[11]));
  newRow.setInt("cor2", int(dataM2[13]));
  newRow.setInt("arenda", int(dataM2[7]));
  newRow.setInt("dopsor", int(dataM2[8]));
  newRow.setString("note", dataM2[9]);
  int u = int(dataM2[0])*2 + int(dataM2[1])*2 + int(dataM2[11])*2 +
    int(dataM2[13])*2 + int(dataM2[7])*2 + int(dataM2[8])*2;
  newRow.setInt("id_R", u);
  newRow.setInt("1/2", int(dataM2[12]));

  String j = ",";
  String rowArh = table.getRowCount() + j + dataM2[2] + j + dataM2[3] + j +
    dataM2[4] + j + dataM2[5] + j + dataM2[6] + j + dataM2[10] + j + dataM2[0] + j +
    dataM2[1] + j + dataM2[11] + j + dataM2[13] + j + dataM2[7] + j + dataM2[8] +
    j + dataM2[9] + j + dataM2[12];

  String[] list = {rowArh};
  saveTable(table, filePath + "base.csv");
  saveTable(table, "data/base.csv");
  saveStrings("data/Arhive/Current/" + timeMonth + "/" + timeDate + "/" +
    timeArh + ".txt", list);

  String[] rep = {outReport()};
  saveStrings(filePath + "report.txt", rep);
}
//****************************************************
void dataSaveReport() {
  TimeString();

  String[] rep = {outReport()};
  saveStrings(filePath + timeReport + "_" + timeArh + ".txt", rep);

  saveTable(table, filePath + timeReport + "_" + timeArh + ".csv");
  saveTable(table, "data/Arhive/Current/" + timeMonth + "/" + timeDate
    + "/" + timeReport + "_" + timeArh + ".csv");
  dataNullBase();
}

void dataNullBase() {
  Table tableNew = new Table();
  tableNew.addColumn("id_R");
  tableNew.addColumn("date");
  tableNew.addColumn("id");
  tableNew.addColumn("nomer");
  tableNew.addColumn("client");
  tableNew.addColumn("object");
  tableNew.addColumn("price");
  tableNew.addColumn("prots");
  tableNew.addColumn("time1");
  tableNew.addColumn("ves1");
  tableNew.addColumn("cor1");
  tableNew.addColumn("time2");
  tableNew.addColumn("ves2");
  tableNew.addColumn("cor2");
  tableNew.addColumn("arenda");
  tableNew.addColumn("dopsor");
  tableNew.addColumn("note");
  tableNew.addColumn("1/2");
  saveTable(tableNew, filePath + "base.csv");
  saveTable(tableNew, "data/base.csv");
}

//****************************************************
// очистка данных
void dataClear() {
  for (int m = 0; m < m2; ++m) {
    if (m == 1) ++m;
    inData[m] = "";
  }
  inData[6] += protsUmolch;
}

//*****************************************************
