//****************************************************
void mousePressed() {
  //---------------
  if ((mouseX > visClean[0]) && (mouseX < visClean[0] + visClean[2]) && 
    (mouseY > visClean[1]) && (mouseY < visClean[1] + visClean[3])) {
    input = 3;
    dataClear();
    inData[1] = "";
    inputData = "";
    flagProts = false;
    flagConfirm = false;
  }
  //---------------
  if ((mouseX > visVes[0]) && (mouseX < visVes[0] + visVes[2]) && 
    (mouseY > visVes[1]) && (mouseY < visVes[1] + visVes[3]) && 
    flagStab && data != 0) {
    TimeString();
    input = 1;
    inData[0] = "";
    inData[0] += dataTablo;
    inData[10] = time;
    inputData = "";
  }
  //---------------
  if ((mouseX > visOk[0]) && (mouseX < visOk[0] + visOk[2]) && 
    (mouseY > visOk[1]) && (mouseY < visOk[1] + visOk[3]) 
    && inData[0] != "" && inData[1] != "" && inData[2] != "" && inData[3] != "" 
    && int(inData[5]) != 0) {
    input = 2;
    if (vis == 0) {
      saveData1();
    } else {
      saveData2();
    }
    inputData = "";
    dataClear();
  }
  //---------------
  if ((mouseX > visZas2[0]+70) && (mouseX < visZas2[0] + visZas2[2] - 75) && 
    (mouseY > visZas2[1]) && (mouseY < visZas2[1] + visZas2[3])) {
    workInputData();
    place = 1;
    inputData = inData[place];
  }
  if ((mouseX > visZas2[2]-60) && (mouseX < visZas2[0] + visZas2[2]) && 
    (mouseY > visZas2[1]) && (mouseY < visZas2[1] + visZas2[3])) {
    workInputData();
    place = 11;
    inputData = inData[place];
  }
  if ((mouseX > visNom[0]+70) && (mouseX < visNom[0] + visNom[2]) && 
    (mouseY > visNom[1]) && (mouseY < visNom[1] + visNom[3])) {
    workInputData();
    place = 2;
    inputData = inData[place];
  }
  if ((mouseX > visCl[0]+70) && (mouseX < visCl[0] + visCl[2]) && 
    (mouseY > visCl[1]) && (mouseY < visCl[1] + visCl[3])) {
    workInputData();
    place = 3;
    inputData = inData[place];
  }
  if ((mouseX > visObj[0]+70) && (mouseX < visObj[0] + visObj[2]) && 
    (mouseY > visObj[1]) && (mouseY < visObj[1] + visObj[3])) {
    workInputData();
    place = 4;
    inputData = inData[place];
  }
  if ((mouseX > visPrice[0]+70) && (mouseX < visPrice[0] + visPrice[2]) && 
    (mouseY > visPrice[1]) && (mouseY < visPrice[1] + visPrice[3])) {
    workInputData();
    place = 5;
    inputData = inData[place];
  }
  if ((mouseX > visProts[0]+70) && (mouseX < visProts[0] + visProts[2]) && 
    (mouseY > visProts[1]) && (mouseY < visProts[1] + visProts[3])) {
    workInputData();
    place = 6;
    inputData = inData[place];
  }
  if ((mouseX > visAren[0]+70) && (mouseX < visAren[0] + visAren[2]) && 
    (mouseY > visAren[1]) && (mouseY < visAren[1] + visAren[3])) {
    workInputData();
    place = 7;
    inputData = inData[place];
  }
  if ((mouseX > visDopS[0]+70) && (mouseX < visDopS[0] + visDopS[2]) && 
    (mouseY > visDopS[1]) && (mouseY < visDopS[1] + visDopS[3])) {
    workInputData();
    place = 8;
    inputData = inData[place];
  }
  if ((mouseX > visDopN[0]+70) && (mouseX < visDopN[0] + visDopN[2]) && 
    (mouseY > visDopN[1]) && (mouseY < visDopN[1] + visDopN[3])) {
    workInputData();
    place = 9;
    inputData = inData[place];
  }
  //---------------
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1]) && (mouseY < visVzw1[1] + visVzw1[3])) {
    if (int(dataM1[0][0]) == 0) {
      vis = 0;
    } else {
      vis = 1;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1] + 30) && (mouseY < visVzw1[1] + visVzw1[3] + 30)) {
    if (int(dataM1[1][0]) == 0) {
      vis = 0;
    } else {
      vis = 2;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1] + 60) && (mouseY < visVzw1[1] + visVzw1[3] + 60)) {
    if (int(dataM1[2][0]) == 0) {
      vis = 0;
    } else {
      vis = 3;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1] + 90) && (mouseY < visVzw1[1] + visVzw1[3] + 90)) {
    if (int(dataM1[3][0]) == 0) {
      vis = 0;
    } else {
      vis = 4;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1] + 120) && (mouseY < visVzw1[1] + visVzw1[3] + 120)) {
    if (int(dataM1[4][0]) == 0) {
      vis = 0;
    } else {
      vis = 5;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visVzw1[0]) && (mouseX < visVzw1[0] + visVzw1[2]) && 
    (mouseY > visVzw1[1] + 150) && (mouseY < visVzw1[1] + visVzw1[3] + 150)) {
    if (int(dataM1[5][0]) == 0) {
      vis = 0;
    } else {
      vis = 6;
      place = 0;
      dataIn(vis);
      flagVzw = true;
      flagProts = false;
    }
  }
  if ((mouseX > visZas2[0]) && (mouseX < visZas2[0] + visZas2[2] - 150) && 
    (mouseY > visZas2[1]) && (mouseY < visZas2[1] + visZas2[3])) {
    flagProts = !flagProts;
  }
}

//****************************************************
void mouseReleased() {
  if ((mouseX > visTablo[0]) && (mouseX < visTablo[0] + visTablo[2]) && 
    (mouseY > visTablo[1]) && (mouseY < visTablo[1] + visTablo[3])) {
    myPort.write(vOff);
    flagTablo = !flagTablo;
    //vis = 0;
  }
  //---------------
  if ((mouseX > visClean[0]) && (mouseX < visClean[0] + visClean[2]) && 
    (mouseY > visClean[1]) && (mouseY < visClean[1] + visClean[3])) {
    input = 0;
    vis = 0;
    inData[1] = "";
  }
  if ((mouseX > visVes[0]) && (mouseX < visVes[0] + visVes[2]) && 
    (mouseY > visVes[1]) && (mouseY < visVes[1] + visVes[3])) {
    input = 0;
  }
  if ((mouseX > visOk[0]) && (mouseX < visOk[0] + visOk[2]) && 
    (mouseY > visOk[1]) && (mouseY < visOk[1] + visOk[3])) {
    input = 0;
  }
}
