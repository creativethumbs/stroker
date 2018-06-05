PImage brush;

void setup() {
  pixelDensity(2); 
  size(500, 400); 
  background(255); 

  String path = dataPath("");

  println("Listing all filenames in a directory: ");
  String[] filenames = listFileNames(path);
  printArray(filenames);
  

  for (int i = 0; i < filenames.length; i++) {
    if (!filenames[i].contains("png")) continue; 

    brush = loadImage(filenames[i]); 
    float spacing = 0.3;  
    float scatter = 0; 

    for (int count = 0; count < 5; count++) {
      float offset = 0.0;
      float scatteroffset = 0.1;
      background(255); 
      float period = random(0.01, 0.03); 
      float mult = 1f; 

      for (float j = 0; j < 400; j += spacing) {
        offset += 0.01; 
        scatteroffset += 0.02;  
        tint(255, 190);
        float ypos = 100 + 60*sin(j*period); 
        float n = ypos + noise(offset)*80*mult;
        n += random(-scatter,scatter); 
        image(brush, j, n); 
         
      } 
      spacing += 0.5;
      scatter += 10; 
      mult *= 1.2;

      save("data/strokes/"+filenames[i]+"-"+count+ ".png");
    }
  }

  exit();
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
