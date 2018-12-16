## 采用rxdart管理app的状态

`rxdart 是什么`
> ReactiveX是一个强大的库，用于通过使用可观察序列来编写异步和基于事件的程序

这个模式的关键思维在于观察者的无状态。我们平时调用方法的时候一定是很清楚我们什么时候调用，并立刻会返回一个预想的结果。
但是在这里，我们中间进行处理的时候，完全是处于异步状态的，也就是说无法立刻返回一个值。我们不知道stream什么时候会“吐”出处理结果，所以必须要一个观察者来守着这个出口。
当有事件/数据流出时，观察者捕捉到了这个事件并解析处理。

- Subject实现并扩展了StreamController,它符合StreamController的所有规范。假如您之前使用的StreamController,那么你可以直接替换为Subject。你可以把它想像成streamController。

- Observable实现并扩展了Stream。它将常用的stream和streamTransformer组合成了非常好用的api。你可以把它想像成stream。
