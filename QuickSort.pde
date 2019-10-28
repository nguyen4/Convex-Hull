class QuickSort {
    
    void quicksort( ArrayList<Point> p){
        quicksort(p, 0, p.size() - 1);
    }
    
    void quicksort( ArrayList<Point> p, int left, int right){
        
        if (left >= right){
            return;
        } 
        
        //find median between left and right and partition
        float pivot = p.get( (left + right) / 2).y();
        int index = partition(p, left, right, pivot);
        quicksort(p, left, index-1);
        quicksort(p, index, right);
    }
    
    int partition( ArrayList<Point> p, int left, int right, float pivot) {
        
        while (left <= right){
            while (p.get(left).y() < pivot) {
                left++;
            }
            
            while (p.get(right).y() > pivot){
                right--;
            }
            
            if (left <= right) {
                Collections.swap(p, left, right);
                left++;
                right--;
            }
        }
        return left;
    } 
}
