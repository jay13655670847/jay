<%--
  Created by IntelliJ IDEA.
  User: 13470
  Date: 2020/4/11
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>目录</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js "></script>

    <script>
        function loadRight(id) {
            parent.parentLoadRight(id);
        }
    </script>
</head>
<body>
<ul class="nav nav-pills nav-stacked">
    <li role="presentation" ><a onclick="loadRight(1)" href="#">第一章 计算机系统概论</a></li>
    <li role="presentation" ><a onclick="loadRight(1.1)" href="#">1.1电子数字计算机的分类</a></li>
    <li role="presentation" ><a onclick="loadRight(1.2)" href="#">1.2数字计算机的五大部件及各自主要功能</a></li>
    <li role="presentation" ><a onclick="loadRight(1.3)" href="#">1.3计算机软件</a></li>

    <li role="presentation"><a onclick="loadRight(2)" href="#">第二章 内部存储器 </a></li>
    <li role="presentation" ><a onclick="loadRight(2.1)" href="#">2.1存储器的分类</a></li>
    <li role="presentation" ><a onclick="loadRight(2.2)" href="#">2.2存储器的分级</a></li>
    <li role="presentation" ><a onclick="loadRight(2.3)" href="#">2.3主存储器的技术指标</a></li>
    <li role="presentation" ><a onclick="loadRight(2.4)" href="#">2.4 SRAM 存储器</a></li>
    <li role="presentation" ><a onclick="loadRight(2.5)" href="#">2.5 DRAM 存储器</a></li>
    <li role="presentation" ><a onclick="loadRight(2.6)" href="#">2.6存储器容量的扩充</a></li>
    <li role="presentation"><a onclick="loadRight(2.7)"  href="#">2.7只读存储器 ROM</a></li>
    <li role="presentation" ><a  onclick="loadRight(2.8)" href="#">2.8并行存储器</a></li>
    <li role="presentation" ><a onclick="loadRight(2.9)"  href="#">2.9 cache基本原理</a></li>
    <li role="presentation" ><a onclick="loadRight(2.10)"  href="#">2.10 cache与主存的地址映射</a></li>
    <li role="presentation" ><a  onclick="loadRight(2.11)" href="#">2.11替换算法</a></li>
    <li role="presentation"><a  onclick="loadRight(2.12)" href="#">2.12 cache的写操作策略</a></li>

    <li role="presentation"><a  onclick="loadRight(3)" href="#">第三章 指令系统</a></li>
    <li role="presentation" ><a onclick="loadRight(3.1)"  href="#">3.1指令系统</a></li>
    <li role="presentation" ><a onclick="loadRight(3.2)"  href="#">3.2指令格式</a></li>
    <li role="presentation" ><a  onclick="loadRight(3.3)" href="#">3.3操作数类型</a></li>
    <li role="presentation" ><a  onclick="loadRight(3.4)" href="#">3.4寻址方式</a></li>
    <li role="presentation" ><a  onclick="loadRight(3.5)" href="#">3.5指令的分类</a></li>
    <li role="presentation" ><a onclick="loadRight(3.6)"  href="#">3.6 RISC技术</a></li>

    <li role="presentation" ><a onclick="loadRight(4)"  href="">第四章 中央处理器</a></li>
    <li role="presentation" ><a onclick="loadRight(4.1)"  href="#">4.1 CPU的功能</a></li>
    <li role="presentation" ><a onclick="loadRight(4.2)"  href="#">4.2 CPU的基本组成</a></li>
    <li role="presentation" ><a onclick="loadRight(4.3)"  href="#">4.3 CPU中的主要寄存器</a></li>
    <li role="presentation" ><a onclick="loadRight(4.4)"  href="#">4.4操作控制器的分类</a></li>
    <li role="presentation" ><a onclick="loadRight(4.5)"  href="#">4.5指令周期</a></li>
    <li role="presentation" ><a onclick="loadRight(4.6)"  href="#">4.6时序信号的作用和体制</a></li>
    <li role="presentation" ><a onclick="loadRight(4.7)"  href="#">4.7控制器的控制方式</a></li>
    <li role="presentation" ><a onclick="loadRight(4.8)"  href="#">4.8微程序控制原理</a></li>
    <li role="presentation" ><a onclick="loadRight(4.9)"  href="#">4.9微命令的编码方法</a></li>
    <li role="presentation" ><a onclick="loadRight(4.10)"  href="#">4.10微指令格式</a></li>

    <li role="presentation" ><a onclick="loadRight(5)"  href="#">第五章 总线系统</a></li>
    <li role="presentation" ><a onclick="loadRight(5.1)"  href="#">5.1总线的概念</a></li>
    <li role="presentation" ><a onclick="loadRight(5.2)"  href="#">5.2总线的分类</a></li>
    <li role="presentation"><a onclick="loadRight(5.3)"  href="#">5.3总线性能指标</a></li>
    <li role="presentation" ><a onclick="loadRight(5.4)"  href="#">5.4总线上信息传送方式</a></li>
    <li role="presentation"><a onclick="loadRight(5.5)"  href="#">5.5总线接口</a></li>
    <li role="presentation" ><a onclick="loadRight(5.6)"  href="#">5.6总线的定时</a></li>
    <li role="presentation" ><a onclick="loadRight(5.7)"  href="#">5.7 PCI总线</a></li>

    <li role="presentation" ><a onclick="loadRight(6)"  href="#">第六章 外围设备</a></li>
    <li role="presentation" ><a onclick="loadRight(6.1)"  href="#">6.1外围设备的定义和分类</a></li>
    <li role="presentation" ><a onclick="loadRight(6.2)"  href="#">6.2磁记录原理</a></li>
    <li role="presentation" ><a onclick="loadRight(6.3)"  href="#">6.3磁表面存储器的读写原理</a></li>
    <li role="presentation" ><a onclick="loadRight(6.4)"  href="#">6.4磁盘的组成和分类</a></li>
    <li role="presentation" ><a onclick="loadRight(6.5)"  href="#">6.5磁盘上信息的分布</a></li>
    <li role="presentation" ><a onclick="loadRight(6.6)"  href="#">6.6磁盘存储器的技术指标</a></li>
    <li role="presentation" ><a onclick="loadRight(6.7)"  href="#">6.7磁盘cache</a></li>
    <li role="presentation" ><a onclick="loadRight(6.8)"  href="#">6.8磁盘阵列RAID</a></li>

    <li role="presentation" ><a onclick="loadRight(7)"  href="#">第七章 输入输出系统</a></li>
    <li role="presentation" ><a onclick="loadRight(7.1)"  href="#">7.1外围设备的速度分级</a></li>
    <li role="presentation" ><a onclick="loadRight(7.2)"  href="#">7.2 I/O和主机信息交换方式</a></li>
    <li role="presentation"><a onclick="loadRight(7.3)"  href="#">7.3程序查询方式</a></li>
    <li role="presentation"><a onclick="loadRight(7.4)"  href="#">7.4中断的概念</a></li>
    <li role="presentation"><a onclick="loadRight(7.5)"  href="#">7.5程序中断方式的原理</a></li>
    <li role="presentation" ><a onclick="loadRight(7.6)"  href="#">7.6中断处理过程中的几个问题</a></li>
    <li role="presentation" ><a onclick="loadRight(7.7)"  href="#">7.7 DMA的基本概念</a></li>
    <li role="presentation" ><a onclick="loadRight(7.8)"  href="#">7.8 DMA能执行的一些操作</a></li>
    <li role="presentation" ><a onclick="loadRight(7.9)"  href="#">7.9 DMA传送方式</a></li>
    <li role="presentation" ><a onclick="loadRight(7.10)"  href="#">7.10 DMA数据传送过程</a></li>
    <li role="presentation" ><a onclick="loadRight(7.11)"  href="#">7.11 CPU对通道的管理</a></li>
    <li role="presentation" ><a onclick="loadRight(7.12)"  href="#">7.12通道的类型</a></li>

    <li role="presentation" ><a onclick="loadRight(8)"  href="#">第八章 操作系统支持</a></li>
    <li role="presentation" ><a onclick="loadRight(8.1)"  href="#">8.1虚拟存储器的概念</a></li>
    <li role="presentation" ><a onclick="loadRight(8.2)"  href="#">8.2虚存的访问过程</a></li>
    <li role="presentation" ><a onclick="loadRight(8.3)"  href="#">8.3几种虚拟存储器</a></li>
    <li role="presentation"><a onclick="loadRight(8.4)"  href="#">8.4页式虚拟存储器</a></li>
    <li role="presentation" ><a onclick="loadRight(8.5)"  href="#">8.5段式虚拟存储器</a></li>
    <li role="presentation" ><a onclick="loadRight(8.6)"  href="#">8.6段页式虚拟存储器</a></li>


</ul>
</body>
</html>
