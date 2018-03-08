class Grid {

  int[] idsToMasses = { 10000, 30, 30, 30, 5, 30, 1000, 1200, 500, 500, 1};
  

  float spacing = 15;
  int drawSpacing = 2;

  int horizontalAmount;
  int verticalAmount;
  PVector[][] gridPositions;
  PVector[][] drawPositions;

  Grid( int sw, int sh) {

    horizontalAmount = (int)(sw/spacing)+1;
    verticalAmount = (int)(sh/spacing)+1;
    gridPositions = new PVector[horizontalAmount][verticalAmount];
    drawPositions = new PVector[horizontalAmount][verticalAmount];
    for (int x=0; x<horizontalAmount; x=x+1) {
      for (int y=0; y<verticalAmount; y=y+1) {
        gridPositions[x][y] = new PVector(x*spacing, y*spacing);
        drawPositions[x][y] = new PVector(x*spacing, y*spacing);
      }
    }
  }

  void draw(ArrayList<TuioObject> tuioObjectList) {



    stroke(255);

    for (int x=0; x<horizontalAmount; x=x+1) {
      for (int y=0; y<verticalAmount; y=y+1) {
        drawPositions[x][y] = new PVector(gridPositions[x][y].x, gridPositions[x][y].y);
      }
    }


    for (int i=0; i<tuioObjectList.size(); i++) {

      // take next found planet and get the position

      TuioObject tobj = tuioObjectList.get(i);
      
      // check if we are not by accident finding id 38 or id 104 or others
      if (tobj.getSymbolID()<idsToMasses.length) {
        
        // get planet mass by id
        float massOfPlanet = idsToMasses[ tobj.getSymbolID() ];
        float exaggerationFactor = 10000;

        PVector planetPosition = new PVector ( tobj.getScreenX(width), tobj.getScreenY(height));

        for (int x=drawSpacing; x<horizontalAmount-drawSpacing; x=x+1) {
          for (int y=drawSpacing; y<verticalAmount-drawSpacing; y=y+1) {

            // distance from grid point to planet
            PVector gridPointToPlanet = PVector.sub(planetPosition, gridPositions[x][y]);


            PVector directionToPlanet = new PVector(gridPointToPlanet.x, gridPointToPlanet.y);
            directionToPlanet.normalize(); // creates a vector of length 1

            float distance = gridPointToPlanet.mag();
            float forceOfPlanet = massOfPlanet / (distance*distance);

            PVector offset = PVector.mult(directionToPlanet, forceOfPlanet * exaggerationFactor);
            if (offset.mag() > distance) {
              //offset.mult(distance).div()
              offset = gridPointToPlanet.copy();
            }

            drawPositions[x][y] = PVector.add(drawPositions[x][y], offset);
            //ellipse( gridPositions[x][y].x, gridPositions[x][y].y, 2, 2);
          }
        }
      }
    }





    // vertical lines
    for (int x=0; x<horizontalAmount; x=x+drawSpacing) {
      for (int y=0; y<verticalAmount-1; y=y+1) {
        line(  drawPositions[x][y].x, drawPositions[x][y].y, 
          drawPositions[x][y+1].x, drawPositions[x][y+1].y);
      }
    }

    //horizontal lines
    for (int y=0; y<verticalAmount; y=y+drawSpacing) {
      for (int x=0; x<horizontalAmount-1; x=x+1) {

        line(  drawPositions[x][y].x, drawPositions[x][y].y, 
          drawPositions[x+1][y].x, drawPositions[x+1][y].y);
      }
    }
  }
}