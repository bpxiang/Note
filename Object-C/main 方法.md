
```
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /*
     自动释放池
     自动释放池的机制是： 它使得应用在创建新对象时，系统能够有效地管理应用所使用的内存
     */
    @autoreleasepool {
        int p, d;
        BOOL isPrime;
        
        for( p = 2; p <= 20; ++p ) {
            isPrime = YES;
            for(d = 2; d < p; ++d ) {
                if( p % d == 0 ) {
                    isPrime = NO;
                }
            }
            
            if ( isPrime == YES ) {
                NSLog(@"%i ", p);
            }
        }
    }
    // 终止 main 的执行并发送（或返回）一个状态值 0
    return 0;
}

```