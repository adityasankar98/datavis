class Fish {
  PImage[] imgs;
  PImage img;
  int imgCt;
  int frame;
  
  //Credit to Freepik at flaticon.com for images
  
  Fish(String folder, int ct) {
    imgCt = ct;
    imgs = new PImage[imgCt];

    /*for (int i = 0; i < imgCt; i++) {
      String file = folder + ".png";//+ nf(i, 2) + ".png";
      imgs[i] = loadImage(file);
    }*/
    
    String file = folder +".png";
    img = loadImage(file);
  }

  void display() {
    /*frame = (frame + 1) % imgCt;
    image(imgs[frame], x, y);*/
    img.resize(50,50);
    image(img,mouseX,mouseY);
  }
}