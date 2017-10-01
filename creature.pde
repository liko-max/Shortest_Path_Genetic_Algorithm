class Creature{
  
  PVector gen[];
  float fitness;
  float len;
  public Creature(){
    gen = new PVector[gen_size];
    len = 0;
    gen[0] = start;
    gen[gen.length-1] = goal;
    for(int i = 1; i < gen_size-1; i++)gen[i] = new PVector(random(width),random(height));
  }
  
  public void calcFitness(){
    for(int i = 0; i < gen.length - 1; i++)len += gen[i].dist(gen[i+1]);
    
    //fitness= exp(-3 * pow(1-start.dist(goal)/len,2));
    fitness = start.dist(goal)/len;
  }
  
  public Creature crossCreatures(Creature other){
    Creature n_cre = new Creature();
    for(int i = 0; i < gen.length; i++)n_cre.gen[i].set( (this.gen[i].x + other.gen[i].x)/2, (this.gen[i].y + other.gen[i].y)/2);   
    return n_cre;
  }
  
  public void mutate(){
    for(int i = 1; i < gen.length-1; i++)if(random(1) < mutationrate)this.gen[i].set(this.gen[i].x + 50 * randomGaussian(), this.gen[i].y + 50 * randomGaussian() );
  }
  
  public void show(int c){
    pushStyle();
    beginShape();
    stroke(c);
    for(int i = 0; i < gen.length; i++){
      vertex(gen[i].x,gen[i].y);
      strokeWeight(3);
      point(gen[i].x, gen[i].y);
      strokeWeight(1);
    }
    endShape();
    popStyle();
  }
  
  
}