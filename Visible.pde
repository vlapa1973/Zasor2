// отображение 

void visible() {
  //  основной верхний и нижний контур
  strokeWeight(3);
  fill(#CFCFCF);
  rect(4, 3, 394, 338, fillet);
  rect(4, 348, 394, 188, fillet);

  strokeWeight(1.2);
  //  табло
  if (!flagTablo) {
    fill(#00FF7F);
    rect(visTablo[0], visTablo[1], visTablo[2], visTablo[3], fillet);
    fill(255, 0, 0);
  } else {
    fill(255, 0, 0);
    rect(visTablo[0], visTablo[1], visTablo[2], visTablo[3], fillet);
    fill(#00FF7F);
  }
  rect(visTablo[0]+4, visTablo[1]+4, visTablo[2]-8, visTablo[3]-8, fillet);
  fill(0);
  textSize(50);
  text(dataTablo, visTablo[0] + 32, visTablo[1] + 58);
  textSize(12);
  text(numberReport, visTablo[0] + 10, visTablo[1] + 20);
  textSize(10);
  text(data, visTablo[0] + 10, visTablo[1] + 72);


  fill(#1E90FF);
  rect(visVzw[0], visVzw[1], visVzw[2], visVzw[3], fillet + 5);
  textSize(40);
  fill(255);
  text(inData[0], visVzw[0] + 10, visVzw[1] + 50);

  if (place == 1) {
    fill(255);
    rect(visZas2[0], visZas2[1], visZas2[2] - 75, visZas2[3], fillet);
    fill(150, 50, 255);
    if (flagProts) fill(255, 150, 150);
    rect(visZas2[0], visZas2[1], visZas2[2] - 150, visZas2[3], fillet);
    fill(255);
    rect(visZas2[0] + 3, visZas2[1] + 3, visZas2[2] - 156, visZas2[3] - 6, fillet);
    fill(0);
    textSize(16);
    text(inputData, visZas2[0] + 85, visZas2[1] + 21);
  } else {
    fill(#FFD700);
    rect(visZas2[0], visZas2[1], visZas2[2] - 75, visZas2[3], fillet);
    rect(visZas2[2] - 60, visZas2[1], 70, visZas2[3], fillet);
    fill(150, 50, 255);
    if (flagProts) fill(255, 150, 150);
    rect(visZas2[0], visZas2[1], visZas2[2] - 150, visZas2[3], fillet);
    fill(#FFD700);
    rect(visZas2[0] + 3, visZas2[1] + 3, visZas2[2] - 156, visZas2[3] - 6, fillet);
    fill(0);
    textSize(16);
    text(inData[1], visZas2[0] + 85, visZas2[1] + 21);
  } 

  if (place == 11) {
    fill(255);
    rect(visZas2[2] - 60, visZas2[1], 70, visZas2[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visZas2[2] - 45, visZas2[1] + 21);
  } else {
    fill(#FFD700);
    rect(visZas2[2] - 60, visZas2[1], 70, visZas2[3], fillet);
    fill(0);
    textSize(16);
    text(inData[11], visZas2[2] - 45, visZas2[1] + 21);
  }

  fill(0);
  textSize(16);
  String a = (!flagProts) ? "кг" : " %";
  text(a, visZas2[0] + 27, visZas2[1] + 21);

  if (place == 2) {
    fill(255);
    rect(visNom[0], visNom[1], visNom[2], visNom[3], fillet);
    rect(visNom[0], visNom[1], visNom[2] - 150, visNom[3], fillet);
    textSize(16);
    fill(0);
    textSize(16);
    text(inputData, visNom[0] + 80, visNom[1] + 21);
  } else {
    fill(#FFD700);
    rect(visNom[0], visNom[1], visNom[2], visNom[3], fillet);
    rect(visNom[0], visNom[1], visNom[2] - 150, visNom[3], fillet);
    textSize(16);
    fill(0);
    textSize(16);
    text(inData[2], visNom[0] + 80, visNom[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Номер", visNom[0] + 13, visNom[1] + 21);

  if (place == 3) {
    fill(255);
    rect(visCl[0], visCl[1], visCl[2], visCl[3], fillet);
    rect(visCl[0], visCl[1], visCl[2] - 150, visCl[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visCl[0] + 80, visCl[1] + 21);
  } else {
    fill(#DDA0DD);
    rect(visCl[0], visCl[1], visCl[2], visCl[3], fillet);
    rect(visCl[0], visCl[1], visCl[2] - 150, visCl[3], fillet);
    fill(0);
    textSize(16);
    text(inData[3], visCl[0] + 80, visCl[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Клиент", visCl[0] + 9, visCl[1] + 21);

  if (place == 4) {
    fill(255);
    rect(visObj[0], visObj[1], visObj[2], visObj[3], fillet);
    rect(visObj[0], visObj[1], visObj[2] - 150, visObj[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visObj[0] + 80, visObj[1] + 21);
  } else {
    fill(#DDA0DD);
    rect(visObj[0], visObj[1], visObj[2], visObj[3], fillet);
    rect(visObj[0], visObj[1], visObj[2] - 150, visObj[3], fillet);
    fill(0);
    textSize(16);
    text(inData[4], visObj[0] + 80, visObj[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Объект", visObj[0] + 9, visObj[1] + 21);  

  if (place == 5) {
    fill(255);
    rect(visPrice[0], visPrice[1], visPrice[2], visPrice[3], fillet);
    rect(visPrice[0], visPrice[1], visPrice[2] - 85, visPrice[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visPrice[0] + 85, visPrice[1] + 21);
  } else {
    fill(#FFE4C4);
    rect(visPrice[0], visPrice[1], visPrice[2], visPrice[3], fillet);
    rect(visPrice[0], visPrice[1], visPrice[2] - 85, visPrice[3], fillet);
    fill(0);
    textSize(16);
    text(inData[5], visPrice[0] + 85, visPrice[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Цена", visPrice[0] + 16, visPrice[1] + 21);  

  if (place == 6) {
    fill(255);
    rect(visProts[0], visProts[1], visProts[2], visProts[3], fillet);
    rect(visProts[0], visProts[1], visProts[2] - 85, visProts[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visProts[0] + 105, visProts[1] + 21);
  } else {
    fill(#FFE4C4);
    rect(visProts[0], visProts[1], visProts[2], visProts[3], fillet);
    rect(visProts[0], visProts[1], visProts[2] - 85, visProts[3], fillet);
    fill(0);
    textSize(16);
    text(inData[6], visProts[0] + 105, visProts[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Засор", visProts[0] + 16, visProts[1] + 21);  

  if (place == 7) {
    fill(255);
    rect(visAren[0], visAren[1], visAren[2], visAren[3], fillet);
    rect(visAren[0], visAren[1], visAren[2] - 85, visAren[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visAren[0] + 90, visAren[1] + 21);
  } else {
    fill(#32CD32);
    rect(visAren[0], visAren[1], visAren[2], visAren[3], fillet);
    rect(visAren[0], visAren[1], visAren[2] - 85, visAren[3], fillet);
    fill(0);
    textSize(16);
    text(inData[7], visAren[0] + 90, visAren[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Аренда", visAren[0] + 9, visAren[1] + 21);  

  if (place == 8) {
    fill(255);
    rect(visDopS[0], visDopS[1], visDopS[2], visDopS[3], fillet);
    rect(visDopS[0], visDopS[1], visDopS[2] - 85, visDopS[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visDopS[0] + 95, visDopS[1] + 21);
  } else {
    fill(#FF8C69);
    rect(visDopS[0], visDopS[1], visDopS[2], visDopS[3], fillet);
    rect(visDopS[0], visDopS[1], visDopS[2] - 85, visDopS[3], fillet);
    fill(0);
    textSize(16);
    text(inData[8], visDopS[0] + 95, visDopS[1] + 21);
  }
  fill(0);
  textSize(14);
  text("ДопСор", visDopS[0] + 8, visDopS[1] + 21);  

  if (place == 9) {
    fill(255);
    rect(visDopN[0], visDopN[1], visDopN[2], visDopN[3], fillet);
    rect(visDopN[0], visDopN[1], visDopN[2] - 310, visDopN[3], fillet);
    fill(0);
    textSize(16);
    text(inputData, visDopN[0] + 80, visDopN[1] + 21);
  } else {
    fill(#FF8C69);
    rect(visDopN[0], visDopN[1], visDopN[2], visDopN[3], fillet);
    rect(visDopN[0], visDopN[1], visDopN[2] - 310, visDopN[3], fillet);
    fill(0);
    textSize(16);
    text(inData[9], visDopN[0] + 80, visDopN[1] + 21);
  }
  fill(0);
  textSize(14);
  text("Прим.", visDopN[0] + 14, visDopN[1] + 21);  
  //--------------------
  stroke(0);
  if (input == 3) {
    fill(0);
    rect(visClean[0], visClean[1], visClean[2], visClean[3], fillet + 5);
    rect(visClean[0] + 9, visClean[1] + 9, visClean[2] - 18, visClean[3] - 18, fillet + 5);
    place = 0;
  } else {
    fill(#836FFF);
    rect(visClean[0], visClean[1], visClean[2], visClean[3], fillet + 5);
    rect(visClean[0]+3, visClean[1]+3, visClean[2]-3*2, visClean[3]-3*2, fillet + 5);
  }
  fill(255);
  textSize(24);
  text("C", visClean[0] + 11, visClean[1] + 29);

  stroke(0);
  if (input == 1) {
    fill(0);
    rect(visVes[0] + 6, visVes[1] + 6, visVes[2] - 12, visVes[3] - 12, fillet + 5);
    rect(visVes[0] + 9, visVes[1] + 9, visVes[2] - 18, visVes[3] - 18, fillet + 5);
    place = 0;
  } else {
    if (flagStab && data != 0) {
      fill(#228B22);
    } else {
      fill(255, 0, 0);
    }
    rect(visVes[0], visVes[1], visVes[2], visVes[3], fillet + 5);
    rect(visVes[0] + 3, visVes[1] + 3, visVes[2] - 6, visVes[3] - 6, fillet + 5);
  }
  fill(255);
  textSize(24);
  text("Взвесить", visVes[0] + 40, visVes[1] + 28);

  stroke(0);
  if (input == 2) {
    fill(0);
    rect(visOk[0] + 6, visOk[1] + 6, visOk[2] - 12, visOk[3] - 12, fillet + 5);
    rect(visOk[0] + 9, visOk[1] + 9, visOk[2] - 18, visOk[3] - 18, fillet + 5);
    place = 0;
  } else {
    if (inData[0] != "" && inData[1] != "" && inData[2] != "" && inData[3] != "" 
      && int(inData[5]) != 0) {
      fill(#54FF9F);
    } else {
      fill(#BC8F8F);
    }
    rect(visOk[0], visOk[1], visOk[2], visOk[3], fillet + 5);
    rect(visOk[0] + 3, visOk[1] + 3, visOk[2] - 6, visOk[3] - 6, fillet + 5);
  }
  fill(255);
  textSize(24);
  text("Oк", visOk[0] + 37, visOk[1] + 28);
  //--------------------
  for (int i = 0; i < m1; ++i) {
    stroke(1);
    fill(#00BFFF);
    if (vis - 1 == i) fill(255);
    rect(visVzw1[0], visVzw1[1] + 30 * i, visVzw1[2], visVzw1[3]);
    rect(visVzw1[0] + 100, visVzw1[1] + 30 * i, visVzw1[2] - 270, visVzw1[3]);
    rect(visVzw1[0] + 300, visVzw1[1] + 30 * i, visVzw1[2] - 300, visVzw1[3]);
    fill(0);
    textSize(12);

    text(dataM1[i][2], visVzw1[0] + 18, visVzw1[1] + 30 * i + 17);
    text(dataM1[i][3], visVzw1[0] + 110, visVzw1[1] + 30 * i + 17);
    if (int(dataM1[i][0]) != 0) {
      text(dataM1[i][0], visVzw1[0] + 235, visVzw1[1] + 30 * i + 17);
    } else {
      text("", visVzw1[0] + 235, visVzw1[1] + 30 * i + 17);
    }
    if (int(dataM1[i][1]) != 0) {
      text(dataM1[i][1], visVzw1[0] + 320, visVzw1[1] + 30 * i + 17);
    } else {
      text("", visVzw1[0] + 320, visVzw1[1] + 30 * i + 17);
    }
  }

  if (place == 2 && flagMenu) {
    strokeWeight(3);
    fill(255);
    rect(menu[0], menu[1] + 30, menu[2], kamazy.length * offsetMenu, fillet);
    strokeWeight(1);
    for (int m = 0; m < kamazy.length; ++m) {
      fill(0, 255, 0);
      if (visMenu != m) fill(255);
      rect(menu[0], menu[1] + offsetMenu * m + 30, menu[2], offsetMenu, fillet);
      fill(0);
      textSize(15);
      text(kamazy[m], menu[0] + 20, menu[1] + offsetMenu * (m + 1) - 7 + 30);
    }
  }

  if (place == 3 && flagMenu) {
    strokeWeight(3);
    fill(255);
    rect(menu[0], menu[1] - 8, menu[2], clients.length * offsetMenu, fillet);
    strokeWeight(1);
    for (int m = 0; m < clients.length; ++m) {
      fill(0, 255, 0);
      if (visMenu != m) fill(255);
      rect(menu[0], menu[1] + offsetMenu * m - 8, menu[2], offsetMenu, fillet);
      fill(0);
      textSize(15);
      text(clients[m], menu[0] + 15, menu[1] - 8 + offsetMenu * (m + 1) - 7);
    }
  }

  if (flagConfirm) {
    fill(255);
    strokeWeight(3);
    fill(84, 255, 159);
    rect(50, 50, 300, 200, fillet);
    textSize(25);
    fill(0);
    text("Отправить отчет ?", 90, 110);
    fill(255);
    rect(210, 145, 45, 35, fillet);
    rect(210, 195, 45, 35, fillet);
    fill(0);
    textSize(20);
    text("Да -    Д", 155, 170);
    text("Нет -    Н", 145, 220);
  }
}

//*****************************************************
void visible2() {
  if (focused) {
    fill(0, 255, 0);
    textSize(125);
    rect(1, 1, 398, 199);
    fill(0);
    text(dataTablo, 3, 150);
    textSize(22);
    text("[" + serialPort + "] - " + Serial.list()[serialPort], 10, 500);
  } else {
    background(0);
    fill(0, 0, 255);
    textSize(125);
    rect(1, 1, 398, 199);
    fill(255);
    text(dataTablo, 3, 150);
    textSize(22);
    text("[" + serialPort + "] - " + Serial.list()[serialPort], 10, 500);
  }
}
