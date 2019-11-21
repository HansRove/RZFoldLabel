# iOS 可显示全部、收起（折叠、展开）的label

* 其实是一个UIView+UITextView，由UITextView支持富文本，支持文本中加link来响应点击事件，做的Label（view）

## 引用方法  [RZFoldLabel](https://github.com/rztime/RZFoldLabel)

* pod 'RZColorful' # 富文本的支持库
* 将 RZFoldLabel/Core/ 下的RZFoldLabel添加到自己代码中

### 使用说明. (可查看demo [RZFoldLabel](https://github.com/rztime/RZFoldLabel))

* 1 同时满足
 	* numberOfLines 
 	* condtion
* 时，将foldAttributedString会添加在文本后
	* 比如：如果codition = more， numberOfLines = 5， 那么attributedText的文本在超过了5行之后，会截取前5行的内容，并把foldAttributedString添加到文本之后


* 2 满足 
	* fold = NO
* 时，将normalAttributedString会添加在文本后 （fold 默认= YES，所以当文本如果未超过1满足的条件，那么将不会追加进去）


* 在 foldAttributedString 和 normalAttributedString 文本中添加可点击的tapAction()，在回调中设置label.fold = !label.fold，即可实现折叠、展开

### 扩展

* 富文本可图文混排，所以可以对富文本进行各项设置达到自己的要求
	* 比如 在需要折叠时，foldAttributedString 里加confer.text(@"...")，即可实现lineBreakMode的样式
	* 在confer.text(@"\n")，即可将追加的文本换到下一行
	* 设置文本的居左、居中、居右、书写方式等，又可以实现不同的样式

还有更多富文本的展现的功能，可以自己去发现，也可以和我沟通求助
