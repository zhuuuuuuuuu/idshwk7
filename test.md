# idshwk7
作业7——基于LSB的图像信息隐藏
  软件：matlab仿真
  载体：灰度图像 
  
LSB信息隐藏技术：
        低比特位(Least Significant Bit,LSB)信息隐藏方法是出现较早的一种信息隐藏技术，其实现比较容易，隐藏时用秘密消息直接替换载
    体数据最不重要的比特位，提取秘密消息时将最低比特位取出，然后再进行解密等处理
        具体做法是选择一个载体元素的子集{𝑗1,𝑗2,𝑗3⋯𝑗𝑚}，其中共有 L(m)个元素，用以隐藏秘密信息的L(m)个比特，然后在这个子集上执行替
    换操作，用秘密信息比特来替换最低位比特。

隐藏过程：
  1. 读入原始图像转换为二进制
  2. 读入要隐藏的信息，转换为二进制
  3. 判断嵌入信息是否过大
  4. 调用随机间隔函数选取像素点
  5. 在选取的像素点的最低位隐藏信息
  6. 生成隐藏信息后的图像

提取过程：
  1. 读入隐藏信息的图像并转化为二进制（在本项目中为test.png文件）
  2. 创建用于写入隐藏信息的文件
  3. 通过共享种子调用随机间隔函数，得知隐藏信息的像素点
  4. 从确定的像素点的最低bit位提取隐藏信息
  5. 将隐藏信息写入文件保存
  