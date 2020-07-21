-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-03-29 05:28:24
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32


CREATE DATABASE iweb CHARSET=UTF8;
USE iweb;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iweb`
--

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `ctid` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`ctid`, `userId`, `courseId`, `count`) VALUES
(4, 3, 8, 2),
(5, 5, 2, 11),
(40, 31, 12, 1),
(41, 31, 11, 1),
(42, 31, 10, 1),
(43, 31, 4, 1),
(52, 4, 12, 1),
(53, 4, 11, 1),
(54, 4, 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `cid` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `cLength` varchar(32) DEFAULT NULL,
  `startTime` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `pic` varchar(32) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `details` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`cid`, `typeId`, `title`, `teacherId`, `cLength`, `startTime`, `address`, `pic`, `price`, `details`) VALUES
(1, 1, '01HTML零基础入门', 1, '1天', '每周一开课', 'i前端各校区 ', 'img-course/01.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(2, 2, '02HTML零基础入门', 2, '1天', '每周一开课', 'i前端各校区 ', 'img-course/02.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(3, 3, '03HTML零基础入门', 3, '1天', '每周一开课', 'i前端各校区 ', 'img-course/03.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(4, 1, '04HTML零基础入门', 4, '1天', '每周一开课', 'i前端各校区 ', 'img-course/04.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(5, 2, '05HTML零基础入门', 1, '1天', '每周一开课', 'i前端各校区 ', 'img-course/05.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(6, 3, '06HTML零基础入门', 2, '1天', '每周一开课', 'i前端各校区 ', 'img-course/06.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(7, 1, '07HTML零基础入门', 3, '1天', '每周一开课', 'i前端各校区 ', 'img-course/06.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(8, 2, '08HTML零基础入门', 4, '1天', '每周一开课', 'i前端各校区 ', 'img-course/05.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(9, 3, '09HTML零基础入门', 1, '1天', '每周一开课', 'i前端各校区 ', 'img-course/04.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(10, 1, '10HTML零基础入门', 2, '1天', '每周一开课', 'i前端各校区 ', 'img-course/03.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(11, 2, '11HTML零基础入门', 3, '1天', '每周一开课', 'i前端各校区 ', 'img-course/02.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>'),
(12, 3, '12HTML零基础入门', 4, '1天', '每周一开课', 'i前端各校区 ', 'img-course/01.png', 399.00, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');

-- --------------------------------------------------------

--
-- 表的结构 `favorite`
--

CREATE TABLE `favorite` (
  `fid` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `fTime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `favorite`
--

INSERT INTO `favorite` (`fid`, `userId`, `courseId`, `fTime`) VALUES
(20, 3, 2, 1584974625),
(21, 4, 1, 1584974933),
(22, 4, 12, 1585404466),
(23, 4, 11, 1585450182);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '订单金额',
  `created` int(10) UNSIGNED NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`oid`, `userId`, `amount`, `created`) VALUES
(1, 4, '1197.00', 1585393088),
(2, 4, '1197.00', 1585393094),
(3, 4, '1197.00', 1585393218),
(4, 4, '1197.00', 1585393222),
(5, 4, '1197.00', 1585403230),
(6, 4, '1197.00', 1585403276),
(7, 4, '1197.00', 1585403328),
(8, 4, '1197.00', 1585403793),
(9, 4, '1197.00', 1585403862);

-- --------------------------------------------------------

--
-- 表的结构 `orders_detail`
--

CREATE TABLE `orders_detail` (
  `odid` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orders_detail`
--

INSERT INTO `orders_detail` (`odid`, `orderId`, `courseId`, `count`) VALUES
(7, 3, 12, 1),
(8, 3, 11, 1),
(25, 9, 12, 1),
(26, 9, 11, 1),
(27, 9, 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `tname` varchar(32) DEFAULT NULL,
  `maincourse` varchar(32) DEFAULT NULL,
  `tpic` varchar(64) DEFAULT NULL,
  `experience` varchar(1024) DEFAULT NULL,
  `style` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`tid`, `tname`, `maincourse`, `tpic`, `experience`, `style`) VALUES
(1, '赵旭', 'Web开发讲师', 'img-teacher/zx.jpg', '达内集团web讲师， 主讲 HTML5、Jquery、 Ajax 等课程。先后在一汽启明、日本インタセクト等公司担任系统开发工程师，从事软件开发和设计工作，迄今已积累5年以上的开发及教学经验，兼具技术和教学两方面的培训能力。', '教学思路严谨，课堂气氛活跃。讲解时善于运用生活当中的例子，使学员能够快速理解。着重培养学员的动手能力，奉行实践是检验真理的唯一标准，教学能力受到学员们的一致好评。'),
(2, '张东', 'JavaScript讲师', 'img-teacher/zd.jpg', '美国PMP认证高级项目经理，微软认证解决方案开发专家。先后在中软国际、中国搜索、太极计算机担任高级开发工程师，架构师，项目经理。曾担任中央外汇管理中心、中国石油、二炮工程研究院、首都国际机场技术咨询顾问。', '一切从实际项目出发，快速入门，学以致用。讲课极富激情，语言表达精准，有感染力。案例丰富、直观，步骤细致，清晰。注重从学习到实际工作的快速转化。'),
(3, '李文华', 'HTTP&SERVER讲师', 'img-teacher/lwh.jpg', '美国PMP认证高级项目经理，微软认证解决方案开发专家。先后在中软国际、中国搜索、太极计算机担任高级开发工程师，架构师，项目经理。曾担任中央外汇管理中心、中国石油、二炮工程研究院、首都国际机场技术咨询顾问。', '一切从实际项目出发，快速入门，学以致用。讲课极富激情，语言表达精准，有感染力。案例丰富、直观，步骤细致，清晰。注重从学习到实际工作的快速转化。'),
(4, '张众磊', 'JS框架专家', 'img-teacher/zzl.jpg', '先后就职于国家电网、凌阳科技，并担任研发组长、项目经理，具有6年Linux平台、移动APP的开发经验，具备深厚的开发和培训功底。', '善于把知识结合贴切的案例，细心、耐心的传授给每个学员；将自身的工作经验和专业的授课手段全部奉献给每个学员；将“让学员就业不再困难”视为己任和奋斗目标。达内集团JS框架专家，主讲Bootstrap、AngularJS、移动开发等课程。'),
(5, '张众磊', 'JS框架专家', 'img-teacher/zzl.jpg', '先后就职于国家电网、凌阳科技，并担任研发组长、项目经理，具有6年Linux平台、移动APP的开发经验，具备深厚的开发和培训功底。', '善于把知识结合贴切的案例，细心、耐心的传授给每个学员；将自身的工作经验和专业的授课手段全部奉献给每个学员；将“让学员就业不再困难”视为己任和奋斗目标。达内集团JS框架专家，主讲Bootstrap、AngularJS、移动开发等课程。');

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE `type` (
  `tpid` int(11) NOT NULL,
  `tpname` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `type`
--

INSERT INTO `type` (`tpid`, `tpname`) VALUES
(1, '基础课程'),
(2, '核心课程'),
(3, '进阶课程');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `nickname` varchar(32) NOT NULL DEFAULT '',
  `sex` varchar(1) NOT NULL DEFAULT '',
  `age` varchar(3) NOT NULL DEFAULT '',
  `edu` varchar(16) NOT NULL DEFAULT '',
  `job` varchar(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `phone`, `upwd`, `nickname`, `sex`, `age`, `edu`, `job`) VALUES
(1, 'admin', '13501234567', '123456', '', '', '', '', ''),
(2, 'test', '13501234568', '123456', '', '', '', '', ''),
(3, 'liwenhu', '13633333334', '123456', '', '', '', '', ''),
(4, 'liwenhua', '13633333333', '123456', '', '', '', '', ''),
(5, 'chengtao', '13622222222', '123456', '', '', '', '', ''),
(6, 'zhangdong', '13611111112', '123456', 'Mrzhang', 'm', '', '', ''),
(7, 'zhangd', '13611111113', '123456', '', '', '', '', ''),
(8, 'zhangda', '13611111111', '123456', '', '', '', '', ''),
(9, 'liran', '13612345678', '123456', '', '', '', '', ''),
(10, 'zhangfei', '13612345670', '123456', '', '', '', '', ''),
(11, 'zhangde', '13612345679', '123456', '', '', '', '', ''),
(12, 'zhangf', '13612345677', '123456', '', '', '', '', ''),
(13, 'zhangd', '13612345674', '123456', '', '', '', '', ''),
(14, 'zhangfo', '13422222222', '123456', '', '', '', '', ''),
(15, 'zhangfei', '13422222228', '123456', '', '', '', '', ''),
(28, 'liwenhua3', '13100000000', '123456', '', '', '', '', ''),
(29, '李四', '13011111111', '123456', '', '', '', '', ''),
(30, '张三', '13200000000', '123456', '', '', '', '', ''),
(31, 'dingding', '13111111111', '123456', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ctid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`odid`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`tpid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `ctid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用表AUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `favorite`
--
ALTER TABLE `favorite`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `odid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用表AUTO_INCREMENT `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `type`
--
ALTER TABLE `type`
  MODIFY `tpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
