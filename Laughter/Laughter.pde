

int radius,x,y,day,sliderTop,sliderHeight,sliderLeft,dayLength,daystart,dayend,Llocation,Lfrequency,Ltype,grow,daytime,line,count,done,birdseye,stime,time,relationship,Lrelationship;
color genuine = color(255, 0, 0);
PImage bg,real,fake,monday,tuesday,wednesday,thursday,friday,saturday,sunday,daybydayI,birdseyeI,allI,strangerI,acquaintanceI,closeI;
String[] LD;
int[][] data = new int[8][102];
int [][] locations={{514,346},{476,660},{108,635},{279,517},{176,102},{280,302}};

void setup(){
  size(1000,800);
  //background(255,230,230);
  radius=1;
  y=400;
  x=500;
  sliderTop=730;
  sliderHeight=15;
  sliderLeft=114;
  dayLength=32;   
  grow=0; 
  daytime=1;
  birdseye=0;
  relationship=0;
 done=0; 
  bg = loadImage("background.png");

  monday = loadImage("monday.png");  
  tuesday = loadImage("tuesday.png");  
  wednesday = loadImage("wednesday.png");  
  thursday = loadImage("thursday.png");  
  friday = loadImage("friday.png");  
  saturday = loadImage("saturday.png");  
  sunday = loadImage("sunday.png");  
  
  real = loadImage("real.png");  
  fake = loadImage("fake.png");  
  
  birdseyeI = loadImage("birdseye.png");  
  daybydayI = loadImage("daybyday.png");  
  
  allI = loadImage("all.png");  
  strangerI = loadImage("stranger.png");  
  acquaintanceI = loadImage("acquaintance.png");  
  closeI = loadImage("close.png");  

  day=0;

  image(bg, 0, 0);
  drawSlider(0);

  LD=loadStrings("laughter.csv");
  int i=0;
  //for (TableRow row : LD.rows()) {
  //  data[0][i] = row.getInt("day");
  //  data[1][i] = row.getInt("time");   
  //  data[2][i] = row.getInt("count");   
  //  data[3][i] = row.getInt("location");   
  //  data[4][i] = row.getInt("type");   
  //  data[5][i] = row.getInt("relationship");   
  //  data[6][i] = row.getInt("mood");   
  //  data[7][i] = row.getInt("frequency");   
  //  i++;
  //}
}


void drawSlider(int day) {
  imageMode(CORNER);
  image(bg, 0, 0);
  stroke(255);
  fill(255);
  if (birdseye==0){
  imageMode(CORNER);
  if (day==1 || day==8 || day==15){
    image(thursday,815,707);
  }
  if (day==2 || day==9 || day==16){
    image(friday,815,707);
  }
  if (day==3 || day==10 || day==17 ){
    image(saturday,815,707);
  }
  if (day==4 || day==11 || day==18 ){
    image(sunday,815,707);
  }
  if (day==5 || day==12 || day==19){
    image(monday,815,707);
  }
  if (day==6 || day==13 || day==20){
    image(tuesday,815,707);
  }
  if (day==7 || day==14 || day==21){
    image(wednesday,815,707);
  }
  rect(114,sliderTop, 672, sliderHeight);
   stroke(180);
  fill(180); 
   for (int i = 1; i <= 20; i++) {
       imageMode(CORNER);
     rect(sliderLeft+i*32,sliderTop, 2, sliderHeight);
    }
  }

 imageMode(CORNER);
  if (birdseye==0){
    image(daybydayI,580,150,170,41);
    tint(255,100);
    image(birdseyeI,780,152,170,41);
    noTint();
  }
  if (birdseye==1){
    tint(255,100);
    image(daybydayI,580,150,170,41);
    noTint();
    image(birdseyeI,780,152,170,41);
     if (relationship==0){
    image(allI,745,250,200,16);
    tint(255,100);
    image(strangerI,745,280,200,16);
    image(acquaintanceI,745,310,200,16);
    image(closeI,745,340,200,16);
    noTint();
  }
 if (relationship==1){
    image(strangerI,745,280,200,16);
    tint(255,100);
    image(allI,745,250,200,16);
    image(acquaintanceI,745,310,200,16);
    image(closeI,745,340,200,16);
    noTint();
  }
   if (relationship==2){
    image(acquaintanceI,745,310,200,16);
    tint(255,100);
    image(allI,745,250,200,16);
    image(strangerI,745,280,200,16);
    image(closeI,745,340,200,16);
    noTint();
  }
   if (relationship==3){
    image(closeI,745,340,200,16);
    tint(255,100);
    image(allI,745,250,200,16);
    image(strangerI,745,280,200,16);
    image(acquaintanceI,745,310,200,16);
    noTint();
  }
  }
 imageMode(CENTER);


}

void findday(int d){
            for (int i = 0; i <= 101; i++) {
             if (data[0][i]==d && data[2][i]==1){
               daystart=i;}
             if (data[0][i]==d && data[2][i]>data[2][i+1]){
               dayend=i;}

          }


}



void drawlaughter (int a){ 
     if (done==0){
          Llocation=data[3][line];

          if (data[4][line]==1 || data[4][line]==3){
            Ltype=1;
            }
            if (data[4][line]==2 || data[4][line]==4){
              Ltype=2;
            }
            Lfrequency=data[7][line];  
  

          imageMode(CENTER); 
          if (Ltype==1)      {  
 //           println(Llocation-1);
            drawSlider(day);
            tint(255,255-(grow)*int((230/(Lfrequency*30))));

            image(fake,locations[Llocation-1][0],locations[Llocation-1][1],grow,grow);
            noTint();
          }
          if (Ltype==2)      {  
             drawSlider(day);
            tint(255,255-(grow)*int((230/(Lfrequency*30))));
             image(real,locations[Llocation-1][0],locations[Llocation-1][1],grow,grow);
             noTint();
          }
          imageMode(CORNER); 
          grow=grow+3;
          if (grow>Lfrequency*30 && line<=dayend){
            grow=0;
            line=line+1;
            noTint();
            drawSlider(day);
          }         
//          println(day,line,daystart,dayend,Lfrequency,grow);
          if (line>dayend || line==102){
            day=0;
            drawSlider(day);
            done=1;
          }
     }

}





void draw(){
  //background(255,200,200);
     frameRate(400); 
    // if (mousePressed==true) { //This loops check if the mouse is pressed on a circle, if so it draws the line and the second circle
     //noTint();
   if (mousePressed==true){
     if (mouseX> 580 && mouseX<750 && mouseY>170 && mouseY<211){
        birdseye=0;
        drawSlider(0);
     }
     if (mouseX> 780 && mouseX<950 && mouseY>170 && mouseY<211){
        birdseye=1;
        drawSlider(0);
        done=0;
     }
   }

    
   if (mousePressed==true){
     if (mouseX> 920 && mouseX<945 && mouseY>243 && mouseY<268){
        relationship=0;
        drawSlider(0);
        done=0;
     }
     if (mouseX> 920 && mouseX<945 && mouseY>273 && mouseY<298){
        relationship=1;
        drawSlider(0);
        done=0;
     }
      if (mouseX> 920 && mouseX<945 && mouseY>303 && mouseY<325){
        relationship=2;
        drawSlider(0);
        done=0;
     }
     if (mouseX> 920 && mouseX<945 && mouseY>333 && mouseY<355){
        relationship=3;
        drawSlider(0);
        done=0;
     }
  }

    
    
     

     
     if (birdseye==0){
     imageMode(CORNER);
     if(mouseY <= sliderTop+sliderHeight &&  mouseY>=sliderTop){
      if (mouseX> sliderLeft && mouseX<sliderLeft+dayLength){
          image(thursday,815,707);    
          if (day<1){
            day=1;
            findday(day);  
            line=daystart;
           }  
          drawlaughter(0);
          

        }
      if (mouseX> sliderLeft+dayLength && mouseX<sliderLeft+2*dayLength){
          image(friday,815,707);    
           if (day<1){
            day=2;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+2*dayLength && mouseX<sliderLeft+3*dayLength){
          image(saturday,815,707);    
           if (day<1){
            day=3;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+3*dayLength && mouseX<sliderLeft+4*dayLength){
           image(sunday,815,707);    
           if (day<1){
            day=4;
            findday(day);  
            line=daystart;
          }  
          image(sunday,815,707);    
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+4*dayLength && mouseX<sliderLeft+5*dayLength){
           image(monday,815,707);    
           if (day<1){
            day=5;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+5*dayLength && mouseX<sliderLeft+6*dayLength){
          image(tuesday,815,707);    
         if (day<1){
            day=6;
            findday(day);  
            line=daystart;
          }  
          image(tuesday,815,707);    
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+6*dayLength && mouseX<sliderLeft+7*dayLength){
          image(wednesday,815,707);    
          if (day<1){
            day=7;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }

      if (mouseX> sliderLeft+7*dayLength && mouseX<sliderLeft+8*dayLength){
          image(thursday,815,707);    
         if (day<1){
            day=8;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
   
      if (mouseX> sliderLeft+8*dayLength && mouseX<sliderLeft+9*dayLength){
          image(friday,815,707);    
         if (day<1){
            day=9;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+9*dayLength && mouseX<sliderLeft+10*dayLength){
          image(saturday,815,707);              
         if (day<1){
            day=10;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
         }
      if (mouseX> sliderLeft+10*dayLength && mouseX<sliderLeft+11*dayLength){
          image(sunday,815,707);    
          if (day<1){
            day=11;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
       } 
      if (mouseX> sliderLeft+11*dayLength && mouseX<sliderLeft+12*dayLength){
          image(monday,815,707);    
         if (day<1){
            day=12;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }    
      if (mouseX> sliderLeft+12*dayLength && mouseX<sliderLeft+13*dayLength){
          image(tuesday,815,707);    
         if (day<1){
            day=13;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        
        }
      if (mouseX> sliderLeft+13*dayLength && mouseX<sliderLeft+14*dayLength){
          image(wednesday,815,707);    
         if (day<1){
            day=14;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+14*dayLength && mouseX<sliderLeft+15*dayLength){
          image(thursday,815,707);    
         if (day<1){
            day=15;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+15*dayLength && mouseX<sliderLeft+16*dayLength){
          image(friday,815,707);    
         if (day<1){
            day=16;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+16*dayLength && mouseX<sliderLeft+17*dayLength){
          image(saturday,815,707);    
         if (day<1){
            day=17;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+17*dayLength && mouseX<sliderLeft+18*dayLength){
         image(sunday,815,707);    
         if (day<1){
            day=18;
            findday(day);  
            line=daystart;
          }  
           drawlaughter(0);
        }
      if (mouseX> sliderLeft+18*dayLength && mouseX<sliderLeft+19*dayLength){
           image(monday,815,707);    
        if (day<1){
            day=19;
            findday(day);  
            line=daystart;
          }  
          drawlaughter(0);
        }
      if (mouseX> sliderLeft+19*dayLength && mouseX<sliderLeft+20*dayLength){
          image(tuesday,815,707);    
         if (day<1){
            day=20;
            findday(day);  
            line=daystart;
          }  


          drawlaughter(0);
        }
      if (mouseX> sliderLeft+20*dayLength && mouseX<sliderLeft+21*dayLength){
          image(wednesday,815,707);        
        if (day<1){
            day=21;
            for (int i = 0; i <= 101; i++) {
             if (data[0][i]==day && data[1][i]==1){
               daystart=i;}
             dayend=daystart+data[1][101];}

            line=daystart;
          }  
          drawlaughter(0);
          }
           
        }
       if (day>0){
      if ((((mouseX< sliderLeft+(day-1)*dayLength || mouseX>sliderLeft+day*dayLength) && (mouseY > sliderTop ||  mouseY<sliderTop+sliderHeight))&&(done==1))){
      //if (mouseX< sliderLeft || mouseX>sliderLeft+21*dayLength) || mouseY < sliderTop ||  mouseY>sliderTop+sliderHeight){      
        drawSlider(0);
        grow=0;
        day=0;  
        done=0;        
        }
      }
     if (mouseY < sliderTop ||  mouseY>sliderTop+sliderHeight){
        drawSlider(day);
        grow=0;
        day=0;  
        done=0;
     }
    }
    if (birdseye==1){
       if (done==0) {
         for (int i = 0; i <= 101; i++) {
          Llocation=data[3][i];
          Lrelationship=data[5][i];

          if (data[4][i]==1 || data[4][i]==3){
            Ltype=1;
            }
            if (data[4][i]==2 || data[4][i]==4){
              Ltype=2;
            }
           Lfrequency=data[7][i];  
           imageMode(CENTER); 
           tint(255,255-50);
          println(i,data[5][i]);

          if (Ltype==1)      {  
            if (relationship==0 || relationship==Lrelationship){
              image(fake,locations[Llocation-1][0]+randomGaussian()*20,locations[Llocation-1][1]+randomGaussian()*20,Lfrequency*3,Lfrequency*3);
            }
            //noTint();
          }
          if (Ltype==2)      {  
           if (relationship==0 || relationship==Lrelationship){
             image(real,locations[Llocation-1][0]+randomGaussian()*20,locations[Llocation-1][1]+randomGaussian()*20,Lfrequency*3,Lfrequency*3);
           }
             //noTint();
          }
          done=1;
         }
     }
    

      
    }

    }
     



void mousePressed(){
  y=mouseY;
  x=mouseX;
}
  