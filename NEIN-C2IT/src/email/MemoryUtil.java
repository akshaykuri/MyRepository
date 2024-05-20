package email;



public class MemoryUtil{

   // private static final int MegaBytes = 10241024;

    public static void main(String args[]) {

    	long heapSize = Runtime.getRuntime().totalMemory(); 

    	// Get maximum size of heap in bytes. The heap cannot grow beyond this size.// Any attempt will result in an OutOfMemoryException.
    	long heapMaxSize = Runtime.getRuntime().maxMemory();

    	 // Get amount of free memory within the heap in bytes. This size will increase // after garbage collection and decrease as new objects are created.
    	long heapFreeSize = Runtime.getRuntime().freeMemory(); 
           
           System.out.println("heapSize = " +heapSize);
           
           System.out.println("heapMaxSize=" +heapMaxSize);
           
           System.out.println("heapFreeSize = " +heapFreeSize);

           

    }
}

