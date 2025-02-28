+---------------------+
|      Stack         |  ↓ Grows Down
|---------------------|
| functionExample(5) |
| localVariable = 10 |
|---------------------|
| main() stack frame |
| heapMemory ptr     |
|---------------------|
|      Heap          |  ↑ Grows Up
| *heapMemory = 55   |
|---------------------|
|      BSS           |
| globalUninitialized |
| staticUninitialized |
|---------------------|
|      Data Segment  |
| globalInitialized = 42 |
| staticInitialized = 99 |
|---------------------|
|      Text Segment  |
| functionExample()   |
| main()             |
+---------------------+
