# @synthesize

```
#import <Foundation/Foundation.h>

@interface Rectangle : NSObject

@property int width, height;

-(void) setWidth: (int) w andHeight: (int) h;
-(int) area;
-(int) perimeter;

@end

@implementation Rectangle

@synthesize width, height;

-(void) setWidth:(int)w andHeight:(int)h
{
    width = w;
    height = h;
}

-(int) area
{
    return width * height;
}

-(int) perimeter
{
    return (width + height) * 2;
}
@end
```

使用合成（synthesize）的存取方法，属性名称的前面不要以 new、alloc、copy 或者 init 这些词开头。这与编译器的一些假定有关，因为编译器会合成相应的方法。  

省略 @synthesize 指令，那么编译器会自动分别命名底层的实例变量 _width 和 _height。

在实现部分显示声明实例变量（或者使用 @synthesize 指令隐形声明的实例变量）是自由的，这意味着并不能在子类中通过名字直接获取到实例的变量。在子类中只能使用继承的存取方法获取实例变量的值。