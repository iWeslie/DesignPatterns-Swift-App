# DesignPatterns-Swift-App

## MVC

![mvc](Images/mvc.png)

- **Models** 持有数据
- **Views** 展示视图和控件，通常是 `UIView` 的子类
- **Controllers** 协调 `Model` 和 `View`，通常是 `UIViewController` 的子类

## Delegation

![delegation](Images/delegation.png)

- **一个对象需要一个代理**，即一个对象有一个代理，为避免引用循环，代理通常是一个弱引用
- 一个 **协议**，定义了可能需要实现的方法
- 一个 **代理**，是一个实现了代理协议的委托对象

依赖一个协议而不是一个实体对象，实现方法起来就更加灵活，因为所有实现了这个协议的对象都可作为代理。

> 使用场合：
>
> 把比较庞大的类拆解，创建泛型或可重用的组建。

> **注意：**
>
> 代理模式容易被滥用，在一个对象需要很多代理的情况下，避免给一个对象创建过多的代理，这时就需要考虑拆分这个对象的功能。
>
> 同样地，如果你不明白这个代理的有用之处，那么就代表你拆分过细了，并且不需要这个代理。
>
>  如果一个对象一定有一个代理，可以考虑把它添加到 `init` 方法里，并且使用 `!` 而不是 `?` 来隐式解包

ControllerA

```swift
protocol ADelegate {
  func doSomething(_ aClass: A, at index: Int)
}

class A {
  weak var delegate: ADelegate?
  func performSomeAction() {
    delegate?.doSomething(self, at: 0)
  }
}
```

ControllerB

```swift
class B: ADelegate {
  func showA() {
    let a = A()
    a.delegate = self
  }
  
  func doSomething(_ aClass: A, at index: Int) {
    //TODO:- handle call back
  }
}
```

