//*****************************************************
//  чтение файла настроек и данных
void loadSetup() {
  JSONArray values;

  values = loadJSONArray(put + "init.json");
  for (int i = 0; i < values.size(); i++) {
    JSONObject animal = values.getJSONObject(i);
    filePath = animal.getString("filePath");
  }

  values = loadJSONArray(filePath + "option.json");
  for (int i = 0; i < values.size(); i++) {
    JSONObject animal = values.getJSONObject(i);
    serialPort = animal.getInt("COMport");
    portSpeed = animal.getInt("portSpeed");
    lf = animal.getInt("numberScales");
    beginIn = animal.getInt("beginIn");
    vIn = animal.getString("scalesIn");
    vOut = animal.getString("scalesOut");
    vOff = animal.getString("scalesOff");
    //filePath = animal.getString("filePath");
    threshold = animal.getInt("threshold");
    stab = animal.getInt("stabWeight");
    tara = animal.getInt("tara");
    protsUmolch = animal.getInt("protsUmolch");
    numberReport = animal.getInt("numberReport");
  }

  values = loadJSONArray(filePath + "temp.json");
  for (int i = 0; i < values.size(); ++i) {
    JSONObject animal = values.getJSONObject(i);
    dataM1[animal.getInt("id")][1] = "" + animal.getInt("zas2");
    dataM1[animal.getInt("id")][2] = animal.getString("nomer");
    dataM1[animal.getInt("id")][3] = animal.getString("client");
    dataM1[animal.getInt("id")][4] = animal.getString("object");
    dataM1[animal.getInt("id")][5] = "" + animal.getInt("price");
    dataM1[animal.getInt("id")][6] = "" + animal.getInt("prots");
    dataM1[animal.getInt("id")][7] = "" + animal.getInt("arenda");
    dataM1[animal.getInt("id")][8] = "" + animal.getInt("dopsor");
    dataM1[animal.getInt("id")][9] = animal.getString("note");
    dataM1[animal.getInt("id")][0] = "" + animal.getInt("ves");
    dataM1[animal.getInt("id")][10] = animal.getString("time");
    dataM1[animal.getInt("id")][11] = "" + animal.getInt("1/2");
  }

  kamazy = loadStrings(filePath + "kamazy.txt");
  clients = loadStrings(filePath + "clients.txt");

  for (int i = 0; i < m2; ++i) {
    inData[i] = "";
  }
  inData[6] = str(protsUmolch);
}
