package render
{
	import coco.component.DefaultItemRenderer;
	import coco.component.Label;
	import coco.component.TextAlign;
	
	public class ListRender extends DefaultItemRenderer
	{
		public function ListRender()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			if (super.data == value) return;
			super.data = value;
			invalidateProperties();
		}
		
		private var idLab : Label;
		private var classLab : Label;
		override protected function createChildren():void
		{
			super.createChildren();
			
			
			labelDisplay.textAlign = TextAlign.LEFT;
			labelDisplay.x = 200;
			
			classLab =new Label();
			classLab.x = 50;
			classLab.y = 5;
			addChild(classLab);
			
			idLab = new Label();
			idLab.x = 300;
			idLab.y = classLab.y;
			addChild(idLab);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(data)
			{
				classLab.text = data["class"]
				idLab.text = data["id"]
			}
				
		}
	}
}