
Polygon ConvexHullGiftWrapped( ArrayList<Point> points ){
  Polygon cHull = new Polygon();
    
    //If there are less than 3 points, dont make a polygon
    if(points.size() <3){
      return cHull;
    }
    
    //sort points from least to greatest
    QuickSort sort = new QuickSort();
    sort.quicksort(points);
      
    RightChain(points, cHull);
    LeftChain(points, cHull);
    
    return cHull;
}

void RightChain( ArrayList<Point> p, Polygon cH){
    
    //add first lowest point 
    int i = 0;
    while ( i < p.size()){
        
        int best_index;
        float least_polar_angle = 1000;
        float x1, x2, y1, y2;
        
        //the next point will initialize best_index and least polar angle
        if(i+1 < p.size()){
            best_index = i + 1;
            cH.addPoint(p.get(i));
            x2 = p.get(i+1).x(); 
            x1 = p.get(i).x();
            y2 = p.get(i+1).y();
            y1 = p.get(i).y();
            least_polar_angle = acos( (x2 - x1)/(float)(Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2))));
        }
        else {return;}
        
        //check every point higher than i for the least polar angle
        for (int j = i+2; j < p.size(); j++){
            x2 = p.get(j).x(); 
            x1 = p.get(i).x();
            y2 = p.get(j).y();
            y1 = p.get(i).y();
            
            float angle = acos( (x2 - x1)/(float)(Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2))));
            
            if(angle < least_polar_angle){
              least_polar_angle = angle;
              best_index = j;
            }
        }
 
        i = best_index;
    }
}

void LeftChain( ArrayList<Point> p, Polygon ch){
    
    println("Left Chain");
    int i = p.size() - 1;
    
    while ( i > 0){
        
        
        int best_index;
        float least_polar_angle = 1000;
        float x1, x2, y1, y2;
        
        //if there is still a point left
        if(i - 1 >= 0){
            ch.addPoint(p.get(i));
            best_index = i - 1;
            x2 = p.get(i-1).x(); 
            x1 = p.get(i).x();
            y2 = p.get(i-1).y();
            y1 = p.get(i).y();
            least_polar_angle = acos( (-1*(x2 - x1))/(float)(Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2))));
        }
        else {return;}
        
        //check every point higher than i for the least polar angle
        for (int j = i-2; j >= 0; j--){
            x2 = p.get(j).x(); 
            x1 = p.get(i).x();
            y2 = p.get(j).y();
            y1 = p.get(i).y();
            
            float angle = acos( (-1*(x2 - x1))/(float)(Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2))));
            
            if(angle < least_polar_angle){
              least_polar_angle = angle;
              best_index = j;
            }
        }
        
        i = best_index;
    }
}
