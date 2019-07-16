# DesignPatterns-Swift-App

## MVC

![mvc](Images/mvc.png)

- **Models** 持有数据
- **Views** 展示视图和控件，通常是 `UIView` 的子类
- **Controllers** 协调 `Model` 和 `View`，通常是 `UIViewController` 的子类

## Delegation委托

![delegation](Images/delegation.png)

- 一个**委托者**，即一个对象有一个委托者来，为避免引用循环，委托者通常是一个弱引用
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

## Strategy策略

![strategy](Images/strategy.png)

- **对象使用一个策略**，这个对象通常是 `ViewController`，但也可以是任何需要可交换行为的对象
- **策略协议**定义了所有策略必须实现的方法
- **策略**就是遵循了上面协议的对象

> 使用场合：
>
> 当你有两个或以上可以交换的行为时，使用策略模式
>
> 相比于代理，策略模式使用一组策略，更趋向易于在运行时改变

> **注意：**
>
> 同样不要滥用策略，比如在一个行为不会改变的情况下则不适用

## Singleton单例

![singleton](Images/singleton.png)

单例即一个类只有一个实例

> **注意：**
>
> 单例非常容易被滥用，如果你遇到需要使用单例的情况，首先考虑是否有别的方法

```swift
class AppSettings {
  static let shared = AppSettings()
  private init() { }
}

let appSettings = AppSettings.shared
```

## Memonto备忘录

![memento](Images/memento.png)

- **原发器**，是需要被保存或恢复的对象
- **备忘录**，代表一个存储状态
- **看管人**，从原发器请求保存，得到一个备忘录。看管人持久化存储备忘录，然后再提供给原发器用来恢复状态。

> 使用场合：
>
> 适用于存储对象状态且可以后续恢复的场合

## Observer观察者

- **Subject**，是被观察的对象
- **Observer**，即观察者

> 使用场合：
>
> 适用于当你需要接收别的对象改变的场合

```swift
// KVO
@objcMembers public class KVOUser: NSObject {
  dynamic var name: String
  public init(name: String) {
    self.name = name
  }
}

let user = KVOUser(name: "Weslie")
var observer: NSNSKeyValueObservation? = user.observe(\.name, options: [.initial, .new]) { (user, change) in 
	print("User's name is \(user.name)")                                                                                         }
```

## Builder建造者

![builder](Images/builder.png)

- **指挥者**接受建造者的输入和坐标，通常是一个 `ViewController` 或者辅助 `class`
- **产品**就是建造出来的复杂对象，通常是一个模型
- **建造者**接受一步步的输入来建造产品

> 使用场合：
>
> 适用于你想一步步来创建复杂的对象的场合，尤其是一个产品需要多个输入
>
> 反之，在你的产品不需要多个输入或者一步步创建的时候则不适用，这种情况就可以考虑便利初始化

## MVVM

![mvvm](Images/mvvm.png)

- **Models** 持有数据
- **Views** 展示视图和控件，通常是 `UIView` 的子类
- **Controllers** 协调 `Model` 和 `View`，通常是 `UIViewController` 的子类
- **ViewModel**把 `Model` 信息转换成 `View` 可以显示的值

## Factory工厂

![factory](Images/factory.png)

- **工厂**生产**产品**

> 使用场合：
>
> 适用于你想把创建对象的逻辑分离出来，而不是直接创建的场合
>
> 尤其是当你有一系列有关联的产品，比如多态的子类或者遵循相同协议的一系列对象的时候