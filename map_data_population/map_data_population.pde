//Data Viz class //

//LIBRARIES
import processing.pdf.*;

//GLOBAL VARIABLES
PShape baseMap;
String csv[];
String myData[][];
PFont myFont; 

//SETUP to set and load our image, strings and arrays
void setup() {
  size(1400, 700);
  myFont = createFont("Arial", 32);
  baseMap= loadShape("WorldMap.svg");
  csv = loadStrings("simplemaps-worldcities-basic.csv");
  myData = new String[csv.length][9];
  for (int i=0; i<csv.length; i++) { 
    myData[i]=csv[i].split(",");
    //  println(myData[i][0]);
  }
}

//DRAW our map and shapes
void draw() {
  beginRecord(PDF, "MapsProcessing.pdf");
  shape(baseMap, 0, 0, width, height);

  for (int i=0; i<myData.length; i++) {

    noStroke();
    float graphLong =map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][2]), 90, -90, 0, height);
    float markerSize = 0.020*sqrt(float(myData[i][4]))/PI;
    if (markerSize<15) {
      fill(1, 132, 254, 90);
      ellipse(graphLong, graphLat, markerSize, markerSize);
      
    } else if (mousePressed) {
      fill(0, 168, 255);
      stroke(255, 255, 255);
      strokeWeight(2);
      ellipse(graphLong, graphLat, markerSize, markerSize);
   
    }

  }
  


  fill(180, 180, 180);
  textFont(myFont);
  text("Cities and Population", 70, 600);
  fill(0);


  endRecord();
}