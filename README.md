## flutter_boss_v1.0 重构

##说明
> 该项目是本人基于网上大佬9个月前公布的仿boss直聘app进行的v1.0版本的重构

`而不是简单的copy，旧项目中有部分bug，本人已经修复，另外对目录结果进行从新调整，欢迎star`

> 项目会持续跟新，欢迎关注

## 效果预览图

![第一步](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/1.gif?raw=true)

![第二步](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/2.gif?raw=true)

> `详情============`

![第三部](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/3.gif?raw=true)

![第四部](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/4.gif?raw=true)

![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/5.gif?raw=true)

![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/shothot/6.gif?raw=true)


## 说明
1. 该项目有许多地方没有完善
 - 启动页白屏
 - 分页指示器dot问题
 - ...
 - 本项目是在9月前flutter_boss 这个项目的基础上用1.0重构
 - 喜欢的朋友star
 - 感兴趣的朋友欢迎PR

2. 本项目短时间内不再更新
3. 该项目说明blog地址是：[blog_adress](http://www.cnblogs.com/gdsblog)

4. time:2018-12-10 

## 说明 v1.1

1. 修复启动白屏问题
2. 新增启动广告页，引导页，倒计时功能

`这两个gif启动较慢，我正在调试测试，耐心看完`

![修复启动白屏问题](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/splashhot/1.gif?raw=true)

2. 新增启动广告页，引导页，倒计时功能
![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/splashhot/2.gif?raw=true)

>time:2018-12-13


# 写一个win上 flutter 打包apk的教程


## 这篇文档介绍一下flutter打包发布正式版apk

> 整体来看，和命令行打包rn的方法相差不大

## 打包前先做检查工作&查看构建配置

1. AndroidManifest.xml 清单
2. 检查pubspec.yaml

## App签名
1. 创建 keystore
keytool命令生成一个私有密钥（Windows上keytool命令放在JDK的bin目录中（比如C:\Program Files\Java\jdkx.x.x_x\bin），你可能需要在命令行中先进入那个目录才能执行此命令。在mac上，直接进入项目根目录输入一下命令）

```
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000

```
```
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

```

![1](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/publicshothot/2.png?raw=true)

`对比上面两条命令key一个生成keystore，一个是生成jks，而生成keystore的已经过期，我们选用第二条`

`JKS 密钥库使用专用格式。建议使用 "keytool -importkeystore -srckeystore boss-release-key.jks -destkeystore boss-release-key.jks -deststoretype pkcs12" 迁移到行业标准格式 PKCS12`


> 这条命令会要求你输入密钥库（keystore）[输入密钥库口令:yaya123...]和对应密钥的密码，然后设> 置一些发行相关的信息。最后它会生成一个叫做my-release-key.jks 的密钥库文件

> 在运行上面这条语句之后，密钥库里应该已经生成了一个单独的密钥，有效期为10000天。--alias参数 > 后面的别名是你将来为应用签名时所需要用到的，所以记得记录这个别名

2. 引用程序引入keystore

> 1.这里主要干两件事，设置全局key.properties或者局部key.properties 2.配置grandle
> 这里我们采用局部key.properties的方法

创建一个名为<app dir>/android/key.properties的文件，其中包含对密钥库的引用：

![2](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/publicshothot/3.png?raw=true)

```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=<location of the key store file, e.g. /Users/<user name>/key.jks>

```
`注意: 保持文件私密; 不要将它加入公共源代码控制中 这里我将其放在我D:\chuangye\fluter\cert\boss-release-key.jks 中`

在gradle中配置签名,通过编辑<app dir>/android/app/build.gradle文件为您的应用配置签名

![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/publicshothot/6.png?raw=true)

## 构建一个发布版（release）APK

1. cd <app dir> (<app dir> 为您的工程目录)

2. 运行flutter build apk (flutter build 默认会包含 --release选项)

![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/publicshothot/4.png?raw=true)

3. 打包好的发布APK位于<app dir>/build/app/outputs/apk/app-release.apk

![](https://github.com/TopGuo/flutter_boss_v1.0/blob/master/bossapp/doc/publicshothot/7.png?raw=true)

## 在设备上安装发行版APK

1. 用USB您的Android设备连接到您的电脑
2. cd <app dir> .
3. 运行 flutter install .

## 到这里该教程完结 

blog地址 [blog地址](http://www.cnblogs.com/gdsblog)

## 打包补充=====

4-：生成发行APK包
cd android && ./gradlew assembleRelease

译注：cd android表示进入android目录（如果你已经在android目录中了那就不用输入了）。
./gradlew assembleRelease在macOS、Linux或是windows的PowerShell环境中表示执行当前目录下的名为gradlew的脚本文件，且其运行参数为assembleRelease，注意这个./不可省略；而在windows的传统CMD命令行下则需要去掉./。

# android.enableAapt2=false

Gradle的assembleRelease参数会把所有用到的JavaScript代码都打包到一起，然后内置到APK包中。如果你想调整下这个行为（比如js代码以及静态资源打包的默认文件名或是目录结构等），可以看看android/app/build.gradle文件。

生成的APK文件位于android/app/build/outputs/apk/app-release.apk，它已经可以用来发布了

**注意
注意：请确保 gradle.properties 中没有包含_org.gradle.configureondemand=true_，否则会跳过 js 打包的步骤，导致最终生成的 apk 是一个无法运行的空壳

在把发行版本提交到 Play Store 之前，你应该做一次最终测试。输入以下命令可以在设备上安装发行版本：

$ react-native run-android --variant=release
注意--variant=release参数只能在你完成了上面的签名配置之后才可以使用。 你现在可以关掉运行中的 packager 了，因为你所有的代码和框架依赖已经都被打包到 apk 包中，可以离线运行了



5-：测试应用的发行版本
cd android && ./gradlew installRelease

注意installRelease参数只能在你完成了上面的签名配置之后才可以使用。 你现在可以关掉运行中的packager了，因为你所有的代码和框架依赖已经都被打包到apk包中，可以离线运行了

在debug和release版本间来回切换安装时可能会报错签名不匹配，此时需要先卸载前一个版本再尝试安装

gradlew assembleRelease 打包生成APK文件

gradlew installRelease 安装APK到手机

gradlew clean 清理上次的打包文件

6-：启用Proguard代码混淆来缩小APK文件的大小

Proguard是一个Java字节码混淆压缩工具，它可以移除掉React Native Java（和它的依赖库中）中没有被使用到的部分，最终有效的减少APK的大小。

重要：启用Proguard之后，你必须再次全面地测试你的应用。Proguard有时候需要为你引入的每个原生库做一些额外的配置。参见app/proguard-rules.pro文件

要启用Proguard，设置minifyEnabled选项为true：

 /**
* 在release发行版中启用Proguard来减小 to shrink the Java    bytecode in release builds.
*/
def enableProguardInReleaseBuilds = true

个人建议：若是你的项目因为添加此属性无法运行，则删除此配置。因为，这个真的会导致各种奇怪的问题
