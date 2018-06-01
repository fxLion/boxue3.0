
function getusername() {
	 var username=sessionStorage.getItem('username');//从sessionStorage中获取ID名为username的值作为用户名
	 //alert(username);
	  if (username==null) {
	         //判断是否为空值，若是空值表示没有登录，则不对登录做任何动作
            //alert(username);
	      }else{
	      //这里表示不为空值，表示已登录，则将登录文字换成登录的username，同时修改链接到显示用户信息的界面（information.jsp）
	 	document.getElementById('login').innerHTML=username;
	 	document.getElementById('login').href='userinformation.jsp';
	 	
	  }


	}

function show(a) //负责切换书籍介绍和评价的界面（默认两个都是隐藏起来的）,a传入值分别为0和1
{
      if (a) {
      //0代表着是左边被点击（即商品介绍被点击）
       document.getElementById("pinglun").style.display="block";//评论界面被隐藏起来
       document.getElementById("bookshow").style.display="none";//商品介绍被显示
     }else{
     //1代表着右边被点击
       document.getElementById("bookshow").style.display="block";
       document.getElementById("pinglun").style.display="none";
     }
	
}

function add(a) {
//这是控制购买商品数量的函数，分别有‘+’‘-’两个按钮。点击’+‘则传入1；点击’-‘则传入-1；
	var num=parseInt(document.getElementById("booknum").value);
    num=num+a;//这里用传入的1/-1进行操作
   if(num<0)
   {
      num=0;//保证购买数量大于等于0
   }
   document.getElementById("booknum").value=num;//将运算好的数量重新加载到html界面中
}
function searchbook() {
	// 这是对在文本框中输入书名后点击搜索后触发的函数
	// 由于书籍数据少而且没有插入到数据库中，所以用if函数对其判断，数据量比较少
	var input=document.getElementById("bookname").value;//获取文本框中的值
	// alert(input)
	if(input=="人间知味")//对比文本框中的值，若是可以匹配的就跳转到相应的书籍界面中；否则弹出对话框提示没有找到相应的书籍
	{
		window.location.href="item-01.html";
	}else if (input=="蜂鸟摄影学院") 
	        {
		      window.location.href="item-02.html";
	        }else if (input=="阿米巴经营") 
	             {
	 	         window.location.href="item-03.html"
	             }else if (input=="动物农场") {
	             	window.location.href="item-04.html"
	             }else if (input=="房思琪的初恋乐园") 
	               {
	             	window.location.href="item-05.html"
	               }else if (input=="自控力") {
	               	window.location.href="item-06.html"
	               }else
	               alert("未找到书籍《"+input+"》请从新输入书名！！");

}
function addbooktocar() {

	// 将选择书的数量加入到购物车旁边的数字中
	var buynum=document.getElementById("booknum").value;
	document.getElementById("shopcarnum").innerHTML=buynum;
}
function buybook(a) {
    //该函数是用户点击立刻购买的按钮后触发的函数
    
	var buynum=Number(document.getElementById('booknum').value);//获取选择购买书籍的数量
	var price=Number(document.getElementById('price'+a).innerHTML).toFixed(2);//Number将返回的string转化成number类型，toFixed(2)是保留小数点后两位
	 var pay=(buynum*price).toFixed(2);//保留小数点后两位
	var pic;//定义一个存放书籍图片地址的变量
	switch(a)//进行判断，该函数会传入数据（0-6）分别表示书籍的编号。根据相应的编号，获取出相应的图片地址并赋值到变量pic中
	{
		case 1:
		pic="images/banner/人间知味.jpg";
		break;
		case 2:
		pic="images/item/单反摄影.jpg";
		break;
		case 3:
		pic="images/item/阿米巴经营.jpg";
		break;
		case 4:
		pic="images/banner/动物农场.jpg";
		break;
		case 5:
		pic="images/item/房思琪的初恋乐园.jpg";
		break;
		case 6:
		pic="images/item/自控力.jpg";
		break;
	}
	
	sessionStorage.setItem('buybooknum',buynum);//将所有获取的数据用sessionStorage的方式存入，目的是可以让购物界面可以获取到
	sessionStorage.setItem('bookprice',price);
	sessionStorage.setItem('paynum',pay);
	sessionStorage.setItem('imgurl',pic);
	window.location.href="shopCar.html";//上述动作做完后将跳转到购物界面中
    
	
}

function shopCarload() {
	//该函数为购物页面加载时一并加载的函数，目的是能获取到用户在书籍界面总存的数据，并将所有数据都加载到本页面的相应的位置中
	document.getElementById('price').innerHTML=sessionStorage.getItem('bookprice');
    document.getElementById('num').innerHTML=sessionStorage.getItem('buybooknum');
    document.getElementById('sum').innerHTML=sessionStorage.getItem('paynum');
    document.getElementById('bookpic').src=sessionStorage.getItem('imgurl');
    document.getElementById('pay').innerHTML=sessionStorage.getItem('paynum');
    getusername();//调用获取用户登录的信息，保证用户在登录后的状态；
}
function confirmpay() {
	//由于本功能还没有完善，所有只能先提示付款成功，并返回首页
	alert('付款成功！');
	window.location.href="index.html";
}