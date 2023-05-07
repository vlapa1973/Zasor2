//*****************************************************
// данные с клавиатуры (нажатие)
void keyPressed() {
  if (key == CODED) {

    if (keyCode == 122 && flagStab && data != 0) {
      TimeString();
      input = 1;
      inData[0] = "";
      inData[0] += dataTablo;
      inData[10] = time;
    }

    if (keyCode == 123 && inData[0] != "" && inData[1] != "" && inData[2] != "" 
      && inData[3] != "" && int(inData[5]) != 0) {
      input = 2;
      if (vis == 0) {
        saveData1();
      } else {
        saveData2();
      }
      inputData = "";
      dataClear();
    }

    if (keyCode == 112) {
      input = 3;
    }
  }
  key = 0;
}
//*****************************************************
//  данные с клавиатуры (отпускание)
void keyReleased() {
  if (key == 'W' || key == 'Ц') {
    flagOpen = true;
    key = 0;
  }

  if (key == 'R' || key == 'К') {
    flagConfirm = true;
  }

  if (key == 'L' || key == 'Д') {    
    if (flagConfirm) {
      numberReport++;
      writeSetup();
      dataSaveReport();
      flagOpen = false;
      key = 0;
      flagConfirm = false;
    }
  }

  if (key == 'Y' || key == 'Н') {    
    flagConfirm = false;
  }

  if (vis != 0 && (key == 'D' || key == 'В')) {
    for (int i = 0; i < m2; ++i) {
      inData[i] = "";
      dataM1[vis - 1][i] = "";
    }
    dataSave2next();
    key = 0;
  }

  if (key == CODED) {

    if (keyCode == DOWN) {
      workInputData();
      if (!flagMenu) {
        place++;
        if (place == 10) place = 9;
      } else {
        visMenu++;
        if (place == 2) {
          if (visMenu >= kamazy.length) visMenu = kamazy.length - 1;
        }
        if (place == 3) {
          if (visMenu >= clients.length) visMenu = clients.length - 1;
        }
      }
      inputData = inData[place];
    }

    if (keyCode == UP) {
      workInputData();
      if (!flagMenu) {
        place--;
        if (place <= 0) place = 1;
      } else {
        visMenu--;
        if (visMenu < 0) visMenu = 0;
      }
      inputData = inData[place];
    }

    if (keyCode == LEFT) {
      workInputData();
      if (!flagMenu) {
        place -= 4;
        if (place <= 0) place = 1;
      } else {
        visMenu -= 4;
        if (visMenu <= 0) visMenu = 0;
      }
      inputData = inData[place];
    }

    if (keyCode == RIGHT) {
      workInputData();
      if (!flagMenu && (place == 2 || place == 3)) {
        flagMenu = true;
        visMenu = -4;
      }
      if (!flagMenu) {
        place += 4;
        if (place >= 9) place = 9;
      } else {
        visMenu += 4;
        if (place == 2) {
          if (visMenu >= kamazy.length - 1) visMenu = kamazy.length - 1;
        }
        if (place == 3) {
          if (visMenu >= clients.length - 1) visMenu = clients.length - 1;
        }
      }
      inputData = inData[place];
    }

    if (keyCode == 122 && 
      flagStab && data != 0) {  //  F11 - взвесить
      input = 0;
    }

    if (keyCode == 123) {  //  F12 - ок
      input = 0;
    }

    if (keyCode == 112) {  //  F1 - очистить
      input = 3;
      dataClear();
      input = 0;
      vis = 0;
      inData[1] = "";
    }

    key = 0;
  }

  if (key > 31) {      // ввод данных
    if (place != 0) {
      if (inputData.length() < 30) {
        inputData += key;
      }
    }
    flagMenu = false;
  }

  if (key == 8) {      //  backspase
    flagMenu = false;
    if (inputData.length() >= 1) {
      inputData = inputData.substring(0, inputData.length() - 1);
    }
  }

  if (key == 127) {    //  стереть все
    inputData = "";
    flagMenu = false;
  }

  if (key == 13 || key == 10) {      //  enter или return
    workInputData();
    if (flagMenu && place == 2 && vis == 0) {
      inData[2] = kamazy[visMenu];
    } 
    if (flagMenu && place == 3 && vis == 0) {
      inData[3] = clients[visMenu];
    } 
    place++;
    if (place < 11) {
      inputData = inData[place];
    } else {
      place = 0;
    }
    flagMenu = false;
  }

  if (key == 9) {  //  вкл/выкл табло
    println(vOff);
    myPort.write(vOff);
    flagTablo = !flagTablo;
    place = 0;
  }
} 
