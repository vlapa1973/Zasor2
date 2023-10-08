//*****************************************************
//  чтение файла настроек и данных
//  все настройки, клиенты, камазы и 1 взвешивания = data/Custom/
//  
//  

void loadSetup() {
  JSONArray values;
  values = loadJSONArray(put + "option.json");      //  = data/Custom/ + ...
  for (int i = 0; i < values.size(); i++) {
    JSONObject animal = values.getJSONObject(i);
    serialPort = animal.getInt("COMport");          //  номер COM порта
    portSpeed = animal.getInt("portSpeed");         //  скорость порта (9600)
    lf = animal.getInt("numberScales");             //  кол-во символов в посылке с весов
    beginIn = animal.getInt("beginIn");             //  начало значащих символов посылки
    vIn = animal.getString("scalesIn");             //  начало не значащих символов посылки
    vOut = animal.getString("scalesOut");           //  конец не значащих символов посылки
    vOff = animal.getString("scalesOff");           //  вся посылка полностью
    filePath = animal.getString("filePath");        //  Ядиск
    threshold = animal.getInt("threshold");         //  нижний порог для обработки з2
    stab = animal.getInt("stabWeight");             //  кол-во весовых посылок для "стабильного" веса
    tara = animal.getInt("tara");                   //  минимальная тара камаза для %
    protsUmolch = animal.getInt("protsUmolch");     //  % засора по умолчанию
    numberReport = animal.getInt("numberReport");   //  порядковый номер отчета
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

  kamazy = loadStrings(put + "kamazy.txt");
  clients = loadStrings(put + "clients.txt");

  for (int i = 0; i < m2; ++i) {
    inData[i] = "";
  }
  inData[6] = str(protsUmolch);
}
