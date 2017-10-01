Creature[] breadPopulation(){
  
  Creature[] new_generation = new Creature[pop_size];
  Creature parent_a, parent_b;
  
  for(int i = 0; i < new_generation.length; i++){
    
    parent_a = pop[findParentIndex()];
    parent_b = pop[findParentIndex()];
    new_generation[i] = parent_a.crossCreatures(parent_b); 
    new_generation[i].mutate();
  }
  
  return new_generation;
}

int findParentIndex(){
  float val;
  int index, timeout = 0;
  do{
    val = random(0.5,1);
    index = floor(random(0, pop_size)); 
    timeout++;
  }while(val > pop[index].fitness && timeout != 1000);
    
  return index; 
}