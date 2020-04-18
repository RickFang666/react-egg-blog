-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: react_blog
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `openId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES ('15871385417','393be1a55b4db9096fb0d191d6bbc5c4','1');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_content` longtext,
  `introduce` longtext,
  `addTime` int DEFAULT NULL,
  `view_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (4,1,'123','123','123',1585756800,1030),(5,1,'JavaScript设计模式','> 设计模式的定义：在面向对象软件设计过程中针对特定问题的简洁而优雅的解决方案\n\n当然我们可以用一个通俗的说法：设计模式是解决某个特定场景下对某种问题的解决方案。因此，当我们遇到合适的场景时，我们可能会条件反射一样自然而然想到符合这种场景的设计模式。\n\n比如，当系统中某个接口的结构已经无法满足我们现在的业务需求，但又不能改动这个接口，因为可能原来的系统很多功能都依赖于这个接口，改动接口会牵扯到太多文件。因此应对这种场景，我们可以很快地想到可以用适配器模式来解决这个问题。\n\n_下面介绍几种在JavaScript中常见的几种设计模式：_\n\n1.单例模式\n------\n\n> 单例模式的定义：保证一个类仅有一个实例，并提供一个访问它的全局访问点。实现的方法为先判断实例存在与否，如果存在则直接返回，如果不存在就创建了再返回，这就确保了一个类只有一个实例对象。\n\n适用场景：一个单一对象。比如：弹窗，无论点击多少次，弹窗只应该被创建一次。\n\n```\nclass CreateUser {    constructor(name) {        this.name = name;        this.getName();    }    getName() {         return this.name;    }}// 代理实现单例模式var ProxyMode = (function() {    var instance = null;    return function(name) {        if(!instance) {            instance = new CreateUser(name);        }        return instance;    }})();// 测试单体模式的实例var a = new ProxyMode(\"aaa\");var b = new ProxyMode(\"bbb\");// 因为单体模式是只实例化一次，所以下面的实例是相等的console.log(a === b);    //true复制代码\n```\n\n2.策略模式\n------\n\n> 策略模式的定义：定义一系列的算法，把他们一个个封装起来，并且使他们可以相互替换。\n\n策略模式的目的就是将算法的使用算法的实现分离开来。\n\n一个基于策略模式的程序至少由两部分组成。第一个部分是一组策略类（可变），策略类封装了具体的算法，并负责具体的计算过程。第二个部分是环境类Context（不变），Context接受客户的请求，随后将请求委托给某一个策略类。要做到这一点，说明Context中要维持对某个策略对象的引用。\n\n```\n/*策略类*/var levelOBJ = {    \"A\": function(money) {        return money * 4;    },    \"B\" : function(money) {        return money * 3;    },    \"C\" : function(money) {        return money * 2;    } \n};/*环境类*/var calculateBouns =function(level,money) {    return levelOBJ\\[level\\](money);};console.log(calculateBouns(\'A\',10000)); // 40000复制代码\n```\n\n3.代理模式\n------\n\n> 代理模式的定义：为一个对象提供一个代用品或占位符，以便控制对它的访问。\n\n常用的虚拟代理形式：某一个花销很大的操作，可以通过虚拟代理的方式延迟到这种需要它的时候才去创建（例：使用虚拟代理实现图片懒加载）\n\n图片懒加载的方式：先通过一张loading图占位，然后通过异步的方式加载图片，等图片加载好了再把完成的图片加载到img标签里面。\n\n```\nvar imgFunc = (function() {    var imgNode = document.createElement(\'img\');    document.body.appendChild(imgNode);    return {        setSrc: function(src) {            imgNode.src = src;        }    }})();var proxyImage = (function() {    var img = new Image();    img.onload = function() {        imgFunc.setSrc(this.src);    }    return {        setSrc: function(src) {            imgFunc.setSrc(\'./loading,gif\');            img.src = src;        }    }})();proxyImage.setSrc(\'./pic.png\');复制代码\n```\n\n使用代理模式实现图片懒加载的优点还有符合单一职责原则。减少一个类或方法的粒度和耦合度。\n\n4.中介者模式\n-------\n\n> 中介者模式的定义：通过一个中介者对象，其他所有的相关对象都通过该中介者对象来通信，而不是相互引用，当其中的一个对象发生改变时，只需要通知中介者对象即可。通过中介者模式可以解除对象与对象之间的紧耦合关系。\n\n例如：现实生活中，航线上的飞机只需要和机场的塔台通信就能确定航线和飞行状态，而不需要和所有飞机通信。同时塔台作为中介者，知道每架飞机的飞行状态，所以可以安排所有飞机的起降和航线安排。\n\n中介者模式适用的场景：例如购物车需求，存在商品选择表单、颜色选择表单、购买数量表单等等，都会触发change事件，那么可以通过中介者来转发处理这些事件，实现各个事件间的解耦，仅仅维护中介者对象即可。\n\n```\nvar goods = {   //手机库存    \'red|32G\': 3,    \'red|64G\': 1,    \'blue|32G\': 7,    \'blue|32G\': 6,};//中介者var mediator = (function() {    var colorSelect = document.getElementById(\'colorSelect\');    var memorySelect = document.getElementById(\'memorySelect\');    var numSelect = document.getElementById(\'numSelect\');    return {        changed: function(obj) {            switch(obj){                case colorSelect:                    //TODO                    break;                case memorySelect:                    //TODO                    break;                case numSelect:                    //TODO                    break;            }        }    }})();colorSelect.onchange = function() {    mediator.changed(this);};memorySelect.onchange = function() {    mediator.changed(this);};numSelect.onchange = function() {    mediator.changed(this);};复制代码\n```\n\n5.装饰者模式\n-------\n\n> 装饰者模式的定义：在不改变对象自身的基础上，在程序运行期间给对象动态地添加方法。\n\n例如：现有4种型号的自行车分别被定义成一个单独的类，如果给每辆自行车都加上前灯、尾灯、铃铛这3个配件，如果用类继承的方式，需要创建4*3=12个子类。但如果通过装饰者模式，只需要创建3个类。\n\n装饰者模式适用的场景：原有方法维持不变，在原有方法上再挂载其他方法来满足现有需求；函数的解耦，将函数拆分成多个可复用的函数，再将拆分出来的函数挂载到某个函数上，实现相同的效果但增强了复用性。\n\n例：用AOP装饰函数实现装饰者模式\n\n```\nFunction.prototype.before = function(beforefn) {    var self = this;    //保存原函数引用    return function(){  //返回包含了原函数和新函数的 \'代理函数\'        beforefn.apply(this, arguments);    //执行新函数，修正this        return self.apply(this,arguments);  //执行原函数    }}Function.prototype.after = function(afterfn) {    var self = this;    return function(){        var ret = self.apply(this,arguments);        afterfn.apply(this, arguments);        return ret;    }}var func = function() {    console.log(\'2\');}//func1和func3为挂载函数var func1 = function() {    console.log(\'1\');}var func3 = function() {    console.log(\'3\');}func = func.before(func1).after(func3);func();\n```','> 设计模式的定义：在面向对象软件设计过程中针对特定问题的简洁而优雅的解决方案',1555516800,1074),(6,1,'test2','test2','test2',1587139200,1028);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_content`
--

DROP TABLE IF EXISTS `blog_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_content` (
  `idblog_content` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `introduce` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idblog_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_content`
--

LOCK TABLES `blog_content` WRITE;
/*!40000 ALTER TABLE `blog_content` DISABLE KEYS */;
INSERT INTO `blog_content` VALUES (1,'rick','blog','helo1','good'),(2,'fun','blog2','hehe','yo');
/*!40000 ALTER TABLE `blog_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL,
  `typeName` varchar(45) DEFAULT NULL,
  `orderNum` int DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'首页',1,'youtube'),(2,'技术',2,'message'),(3,'生活',3,'smile');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-18 21:05:57
