// Draw a classical Minoan labyrinth
// by Rupert Russell rupert@rupert.id.au
// Code on Github at: https://github.com/rupertrussell/minoan-labyrinth
// Artwork on redbubble at: https://www.redbubble.com/shop/ap/46068650
// Artwork size 7632 x 7632
// 18 March 2020
// Thanks to:
// https://blogmymaze.wordpress.com/2020/02/23/how-to-calculate-the-classical-7-circuit-labyrinth/
// https://blogmymaze.files.wordpress.com/2020/02/calculator_cretan_7_mymaze_2020_en.pdf

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...
// http://jeffreythompson.org/collision-detection/line-circle.php 

float x;
float y;

int scale = 90; // 90 for screen  // 1200 for redbubble
int designWeight = 15; // 10 for screen // 250 for redbubble

int count = 0;

float m1r1 = 7.5 * scale;
float m1r2 = 6.5 * scale;
float m1r3 = 5.5 * scale;
float m1r4 = 4.5 * scale;
float m1r5 = 3.5 * scale;
float m1r6 = 2.5 * scale;
float m1r7 = 1.5 * scale;
float m1r8 = 0.5 * scale;

float m2r1 = 5 * scale;
float m2r2 = 4 * scale;
float m2r3 = 3 * scale;
float m2r4 = 2 * scale;
float m2r5 = 1 * scale;

float m3r1 = 6 * scale;
float m3r2 = 5 * scale;
float m3r3 = 4 * scale;
float m3r4 = 3 * scale;
float m3r5 = 2 * scale;
float m3r6 = 1 * scale;

float m4r1 = 1 * scale;

float m5r1 = 2 * scale;
float m5r2 = 1 * scale;

float m1X = 0;
float m1Y = 0;

float m2X = - 1.25* scale;
float m2Y = 0 * scale;

float m3X = 0.75 * scale;
float m3Y = 0 * scale;

float m4X = - 1.25* scale;
float m4Y = 2 * scale; 

float m5X = 0.75 * scale; 
float m5Y = 2 * scale; 

float r3Start = 145.9;
float r5Start = 145.9;
float r7Start = 145.9;
float r9Start = 145.9;

float r3End = 401.3;
float r5End = 401.3;
float r7End = 401.3;
float r9End = 401.3;

float m1r1Start =180;
float m1r2Start =180;
float m1r3Start =180;
float m1r4Start =180;
float m1r5Start =180;
float m1r6Start =180;
float m1r7Start =180;
float m1r8Start =180;

float m1r1End = 360;
float m1r2End = 360;
float m1r3End = 360;
float m1r4End = 360;
float m1r5End = 360;
float m1r6End = 360;
float m1r7End = 360;
float m1r8End = 360;

float m2r1Start = 90;
float m2r2Start = 90;
float m2r3Start = 90;
float m2r4Start = 90;
float m2r5Start = 0;

float m2r1End = 180;
float m2r2End = 180;
float m2r3End = 180;
float m2r4End = 180;
float m2r5End = 180;

float m3r1Start = 0;
float m3r2Start = 0;
float m3r3Start = 0;
float m3r4Start = 0;
float m3r5Start = 0;
float m3r6Start = 0;

float m3r1End = 90;
float m3r2End = 90;
float m3r3End = 90;
float m3r4End = 90;
float m3r5End = 90;
float m3r6End = 180;

float m4r1Start = - 90;
float m4r1End = 90 ;

float m5r1Start = 90;
float m5r2Start = 90;

float m5r1End = 180;
float m5r2End = 180 + 90;

float closestX = 0;
float closestY = 0;

float x1 = 0;    
float y1 = 0;
float x2 = 0;
float y2 = 0;

import processing.pdf.*;

void setup() {
  strokeCap(ROUND);
  size(800, 800); // (800, 800); for screen (10000, 10000); for redbubble
  background(255);
  noLoop();
  // beginRecord(PDF, "minoan-labyrinth-007.pdf");
}

void draw() {
  boolean guideLines = false;
  background(255);
  translate(width/2, height/2);
  noFill();


  // outer circle
  if (guideLines) {
    stroke(255, 0, 0); // red
    circle(0, 0, 33 * scale);  // outer circle
    circle(0, 0, 4); // center marker

    strokeWeight(0.5);
    // Circles around center (0,0) m1
    circle(0, 0, m1r7);
    circle(0, 0, m1r6);
    circle(0, 0, m1r5);
    circle(0, 0, m1r4);
    circle(0, 0, m1r3);
    circle(0, 0, m1r2);
    circle(0, 0, m1r1);
  }
  stroke(0, 0, 0); // black
  strokeWeight(designWeight);
  
  // line(m1X - 0.5 * scale, m1Y, m1X - 0.5 * scale, 2.0 * scale); // verticle from center of M1 offset left 0.5 * scale
  arc(m1X, m1Y, m1r1, m1r1, radians(m1r1Start), radians(m1r1End));
  arc(m1X, m1Y, m1r2, m1r2, radians(m1r2Start), radians(m1r2End));
  arc(m1X, m1Y, m1r3, m1r3, radians(m1r3Start), radians(m1r3End));
  arc(m1X, m1Y, m1r4, m1r4, radians(m1r4Start), radians(m1r4End));
  arc(m1X, m1Y, m1r5, m1r5, radians(m1r5Start), radians(m1r5End));
  arc(m1X, m1Y, m1r6, m1r6, radians(m1r6Start), radians(m1r6End));
  arc(m1X, m1Y, m1r7, m1r7, radians(m1r7Start), radians(m1r7End));
  arc(m1X, m1Y, m1r8, m1r8, radians(m1r8Start), radians(m1r8End));

  // stroke(0, 255, 0); // green
  arc(m2X, m2Y, m2r1, m2r1, radians(m2r1Start), radians(m2r1End));
  arc(m2X, m2Y, m2r2, m2r2, radians(m2r2Start), radians(m2r2End));
  arc(m2X, m2Y, m2r3, m2r3, radians(m2r3Start), radians(m2r3End));
  arc(m2X, m2Y, m2r4, m2r4, radians(m2r4Start), radians(m2r4End));
  arc(m2X, m2Y, m2r5, m2r5, radians(m2r5Start), radians(m2r5End));

  // stroke(0, 0, 255); // blue
  arc(m3X, m3Y, m3r1, m3r1, radians(m3r1Start), radians(m3r1End));
  arc(m3X, m3Y, m3r2, m3r2, radians(m3r2Start), radians(m3r2End));
  arc(m3X, m3Y, m3r3, m3r3, radians(m3r3Start), radians(m3r3End));
  arc(m3X, m3Y, m3r4, m3r4, radians(m3r4Start), radians(m3r4End));
  arc(m3X, m3Y, m3r5, m3r5, radians(m3r5Start), radians(m3r5End));
  arc(m3X, m3Y, m3r6, m3r6, radians(m3r6Start), radians(m3r6End));

  // stroke(0, 255, 0); // green
  arc(m4X, m4Y, m4r1, m4r1, radians(m4r1Start), radians(m4r1End));
  arc(m5X, m5Y, m5r1, m5r1, radians(m5r1Start), radians(m5r1End));
  stroke(0, 0, 0); // black
  arc(m5X, m5Y, m5r2, m5r2, radians(m5r2Start), radians(m5r2End));

  if (guideLines) {
    // M2 Circle
    stroke(255, 0, 0); // red
    fill(255, 0, 0);
    circle(m2X, m2Y, 6); // center marker for M2 (Right)    
    noFill();
    strokeWeight(1);
    circle(m2X, m2Y, m1r8); // R1 Circle around M2

    // M3 Circle
    stroke(0, 0, 255); // blue
    fill(0, 0, 255); // blue
    circle(m3X, m3Y, 6); // center marker for M3 (Left)
    noFill();
    circle(m3X, m3Y, m1r8); // R1 Circle around M3
  }
  int m3r5Start = -105 + 180;
  float m3r5End =  m3r3End;

  // center cross
  stroke(0, 0, 0); // black
  strokeWeight(designWeight);
  ;
  line(m1X - 0.25 * scale, m1Y, m1X - 0.25 * scale, m1Y + 2 * scale);
  line(m2X, 1 * scale, m3X, 1 * scale );

  save("minoan-007.png");
  // endRecord();
  // exit();  // enable exit for Redbubble 
}
