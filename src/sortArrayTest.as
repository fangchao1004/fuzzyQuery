package
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import coco.component.Label;
	import coco.component.List;
	import coco.component.TextInput;
	import coco.core.Application;
	import coco.event.UIEvent;
	
	import render.ListRender;
	
	[SWF (width="520",height="450")]
	public class sortArrayTest extends Application
	{
		private var textInput : TextInput;
		private var testData : Array
		private var myList : List;
		public function sortArrayTest()
		{
			testData = 
				[{"name":"机器人ss","id":"001","class":"一年1班"},{"name":"速度","id":"002","class":"一年2班"},
					{"name":"机器人aa","id":"013","class":"一年3班"},{"name":"速度1","id":"214","class":"二年4班"},
					{"name":"Tom","id":"015","class":"一年5班"},{"name":"robot6","id":"126","class":"一年6班"},
					{"name":"tom123","id":"107","class":"一年7班"},{"name":"robot8","id":"008","class":"二年8班"}];
			
			trace(JSON.stringify(testData.sortOn("class",Array.CASEINSENSITIVE|Array.DESCENDING)));
			var resultArray : Array = [];
			
			myList = new List();
			myList.gap = 10;
			myList.width = 400;
			myList.height = 400;
			myList.x = 50;
			myList.y = 85;
			myList.labelField = "name";
			myList.itemRendererClass = ListRender;
			myList.dataProvider = testData;
			addChild(myList);
			
			
			textInput = new TextInput();
			textInput.x = 50;
			textInput.y = 15;
			textInput.addEventListener(UIEvent.CHANGE,changeHandler);
			addChild(textInput);
			
			var lab1 : Label = new Label();
			lab1.text = "班级";
			lab1.x = 110;
			lab1.y = 60;
			addChild(lab1);
			
			var lab2 : Label = new Label();
			lab2.text = "名称";
			lab2.x = 250;
			lab2.y = 60;
			addChild(lab2);
			
			var lab3 : Label = new Label();
			lab3.text = "ID";
			lab3.x = 350;
			lab3.y = 60;
			addChild(lab3);
		}
		
		private var time : uint;
		private var keyWord : String;
		private var tempArray : Array=[];
		protected function changeHandler(event:UIEvent):void
		{
			///获取到关键字后  首先 默认先去找"id"看是否有对应的 如果找不到 再找“name”,再找“class”
			///都找不到 list.dataProvider = oldData;
			///找到的数据 push 进新的数组中，再把数组进行"id"的排序 
			///再把上一步得到的数组 赋值给list
			
			keyWord = event.currentTarget.text;
			if(time)
				clearTimeout(time);
			time = setTimeout(searchHandler2,500);
		}
		
		private function searchHandler2():void
		{
			myList.dataProvider = FuzzyQuery.getInstance().searchHandler(keyWord,testData);
		}
		
	}
}