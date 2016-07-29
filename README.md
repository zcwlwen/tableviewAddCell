# tableviewAddCell
模仿类似聊天的UI

实现类似映客App中的聊天室功能，场景为有人发送一条数据，TableView增加一条信息，这里数据使用一个button来模拟，
如果是实时通信的话，使用Socket方式连接到服务器，当服务器推送一条数据过来，这里添加一条数据。
始终让TableView显示最后几个cell，就是默认显示TableView最底部
下面代码实现上面效果
```Objective-C
[_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
```
但是我在测试的时候有一个问题，当TableView滚动的时候添加一条数据会显示bug直接跳到最上面，
所以这里要做一个判断就是在滑动的时候不执行、在手触摸移动、滚动的时候不执行。
```Objective-C
 //滑动时不进行调用
    if(!_testTable.isDragging) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
    //手触摸、移动或者滚动时，不调用
    if(!(_testTable.isTracking || _testTable.isDragging || _testTable.isDecelerating)) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
```
![屏幕快照 2016-07-29 上午10.41.50.png](http://ww3.sinaimg.cn/large/72f96cbagw1f6ame1j9jgj20pm17macq.jpg)
