# IOS
医疗随访是医务工作者了解患者病情的基本工作方式之一。经过多年的发展,医疗随访已经由早期的主要关注病案管理,发展到涉及医生、患者、病案室、医院管理者等多个层次用户日常工作的基本需求。随着医疗信息化不断深入发展,医疗随访的信息化建设也得到大力发展。
病人随访APP以用户为本，医生为主体，以服务病人为核心，提升随访工作效率，帮助医生从繁重无序的随访工作中解放出来， APP集成即时通讯，可以更加轻松的进行随访工作。论文分析了病人随访行业的现状，介绍了开发工具和技术，对病人随访APP进行需求分析，并且进行相应的系统设计，最后完成了系统的实现


Medical follow-up is one of the approaches for medical staff to command the patients’ conditions. Years have witnessed it’s rapid development, focusing from the early case managements, to the complex connections among the doctors, patients, rooms of medical records and the leaders of the hospitals and also their complicated work contents. With the quick development of the medical information, the correspondent construction of the medical follow-up needs to keep up.
To better doctors’ service for the patients and meanwhile to reduce the working burdens of the doctors and improve their work efficiency, this application combines all the instant communications to provide easier ways for the medial follow-up work. This thesis has achieved the following goals: 1. To analyze the conditions of the medical follow-up industry 2. To introduce the developing tools and techniques  3. To analyze the needs of this field  4. To deign how to realize the collected needs and then carry the plan out  5. To illustrate the process of testing this application.

在制作病人随访APP的过程当中，我采用多种设计模式，包括：MVC模式,单例模式，观察者模式，委托模式。下面请允许我对用到的设计模式进行介绍：
	MVC模式

MVC全名是Model View Controller，是一种常见的软件设计模式，该设计模式是将业务逻辑、界面、数据显示分离，编写代码的方法，MVC定义了Cocoa框架的总体结构，是一种高级别的模式，将应用分为模型层、视图层、控制器层。MVC的名称也是模型-视图-控制器的英文首字母的缩写。它最初出现在20世纪70年代的Smalltalk编程语言中[3]。在编写代码的同时使用MVC模式，能减少代码之间的耦合。使程序结构清晰明朗，便于后期代码的修改和维护。

单例模式
单例模式，指的是整个应用或系统只能有该类的一个实例，在iOS开发中我们经常碰到只需要某类一个实例的情况，最常见的莫过于对硬件参数的访问类，比如UIAccelerometer.这个类可以帮助我们得硬件在各个方向轴上的加速度，但是我们仅仅需要它的一个实例就够了，更多的话，只会浪费内存，降低程序的性能。[4]

所以苹果提供了一个UIAccelerometer的实例化方法＋sharedAccelerometer,从名字上我们也能看出此方法让整个应用共享一个UIAccelerometer实例，它内部的如何实现我们暂且不谈，先来看看还有哪些类同样使用了单例模式。
UIApplication类提供了＋sharedApplication方法创建和获取UIApplication单例
NSNotificationCenter提供了＋defaultCenter方法创建和获取NSNotificationCenter单例（PS：该类还遵循了另一个重要的设计模式：观察者模式）
NSUserDefaults类提供了＋defaultUserDefaults方法去创建和获取NSUserDefaults单例

观察者模式
观察者模式中，在iOS的通知机制中，对某个通知感兴趣的所有对象都能够成为消息接受者。首先，这些对象需要向通知中心（NSNotificationCenter）发出addObserver:selector:name:object:消息进行注册，在投送对象投送通知给通知中心时，通知中心就会把通知广播给注册过的接受者。所有的接受者不知道通知是谁投送的，不去关心它的细节。投送对象和接受者是一对多的关系。如果接受者对消息通知不再进行关注，这个时候会给通知中心发送removeObserver:name:Object:的消息解除注册，并且以后不再接受通知。

委托模式
委托模式中，类可以实现或不实现协议（接口）中的方法。通过此种方式，达到最大的解耦目的，方便项目的扩展。不过需要设置应用的委托对象，以确定协议中的方法为谁服务。比如UITableViewDelegate UITableViewDataSource来举例：实现一个页面有一个UItableView，UItableView的每一栏（cell）的数据由我们指定，于是定义了一个接口，这个接口有许多的方法，只需要我们把要服务的对象传进去，就可以使用这些方法了，这个接口就是委托和协议。而UITableViewDelegate 和 UITableViewDataSource 就是专为UITableView而写的委托和协议。
 
 1.3.4 引用框架
因为我是一位初学者，在开发当中遇到很多问题，当我遇到做不来的东西的时候，我往往会在Github上阅读他人的源码并且进行学习，在这个过程中，我发现Github上有许多美妙的开源框架，极大的帮助我解决问题，我也引用在病人随访APP中，下面对我引用的开源框架做一个介绍：

FMDB:SQlite数据库
SQLite是一个开源的嵌入式关系数据库，实现自包容、零配置、支持事务的SQL数据库引擎。 其特点是高度便携、使用方便、结构紧凑、高效、可靠。与其他数据库管理系统不同，SQLite的安装和运行非常简单，在大多数情况下，只要确保SQLite的二进制文件存在即可开始创建、连接和使用数据库。[5]
虽然iOS用的就是sqlite3数据库，用原生的sql语句也能够实现相应的功能，但是书写起来比较麻烦，尤其是对于我这个初学者来说还是比较困难的，所以我在网上寻找到了SQLite的封装方法FMDB。
FMDB有三个主要的类
1.FMDatabase – 表示一个单独的SQLite数据库。用来执行SQLite的命令。
2.FMResultSet – 表示FMDatabase执行查询后结果集
3.FMDatabaseQueue – 如果你想在多线程中执行多个查询或更新，你应该使用该类。这是线程安全的。

XMPP相关
XMPP是一种基于XML的协议，它继承了在XML环境中灵活的发展性。这表明XMPP是可扩展的。可以通过发送扩展的信息来处理用户的需求，以及在XMP的顶端建立如内容发布系统和基于地址的服务等应用程序。[6]而且，XMPP包含了针对服务器端的软件协议，使之能与另一个进行通话，这使得开发者更容易建立客户应用程序或给一个配置好的系统添加功能。XMPP的核心XML流传输协议的定义使得XMPP能够在一个比以往网络通信协议更规范的平台上。借助于XML易于解析和阅读的特性，使得XMPP的协议能够非常漂亮。[7]
XMPP是一个分散型通信网络，因此，只要网络的基础设施条件符合要求，任何XMPP的用户都可以向其他任何系统的XMPP用户传递发送消息。在集成即时通讯功能的时候，我采用的服务器是ejabberd这个服务器，ejabberd支持Linux / Mac OS X / Solaris / Windows，并将服务器布置在本地环境上。

