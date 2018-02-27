# Memcached-slabs 内存分配

[slabs.c 注解](https://github.com/steveLauwh/Database/blob/master/Memcached/memcached-1.5.4/slabs.c)

Memcached 声明一个 slabclass_t 结构体，如下：

```c
/* slab class(内存池)内存分配结构体*/
// slab class 包含若干个相同大小的slab 分配器
typedef struct {
    //当前slab class 分配一个item 的大小     
    unsigned int size;      /* sizes of items */

    // 每一个slab 分配器能分配多少个item
    unsigned int perslab;   /* how many items per slab */

    // 指向空闲item 的指针
    void *slots;           /* list of item ptrs */  

    // 总共多少个空闲的item
    unsigned int sl_curr;   /* total free items in list */

    // slab class 的可用slab 分配器个数
    unsigned int slabs;     /* how many slabs were allocated for this class */ 

    //slab 数组，数组的每一个元素就是一个slab分配器，这些分配器都分配相同尺寸的内存  
    void **slab_list;       /* array of slab pointers */

    // slab 数组的大小
    unsigned int list_size; /* size of prev array */

    // 总共请求的bytes
    size_t requested; /* The number of requested bytes */
} slabclass_t;
```

问题：Memcached 如何设计 slabs 内存分配？

为了防止内存碎片，设计不同规格的内存块，内存块在 Memcached 里就是 slabclass，最大支持有 63 种不同规格。



