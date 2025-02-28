#include <iostream>

using namespace std;

// BSS Segment (Uninitialized global & static variables)
int globalUninitialized;  
static int staticUninitialized;

// Data Segment (Initialized global & static variables)
int globalInitialized = 42;
static int staticInitialized = 99;

void functionExample(int x) { 
    // Stack Segment (Function call, local variables)
    int localVariable = x * 2;  
    cout << "Local Variable: " << localVariable << endl;
}

int main() {
    // Heap Segment (Dynamically allocated memory using new)
    int* heapMemory = new int(55); 
    
    cout << "Heap Value: " << *heapMemory << endl;
    
    functionExample(5);  // Call function to see stack behavior
    
    delete heapMemory;  // Free heap memory
    return 0;
}
