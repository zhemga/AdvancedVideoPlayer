   M S B A M L   `   `   `  ���� N  JAdvancedVideoPlayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MouseBehaivorSpaceMouseBehaivorSpace  !    CW._2020._23._09.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     2local clr-namespace:MouseBehaivorSpace     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3b+http://schemas.microsoft.com/xaml/behaviors  S OPrism.Wpf, Version=8.0.0.1909, Culture=neutral, PublicKeyToken=40ee6c3a2184dc59'cmdhttp://www.codeplex.com/prism    � Title$  Advanced Video Player��$��90��$	��120��
���   � � Icon$ AVPicon16.png�� � WindowStyle �� *WindowStyle+ � WindowState �� *WindowState+ � Topmost �� *TopmostState+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ 
MouseLeave��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *HideAllControls+  $ 
MouseEnter��.    �� *ShowAllControls+  $ MouseDoubleClick��.    �� *DoubleClickFS+  $ Closing��.    �� *	AddInList+	   	Behaviors	 '   !MouseBehaivorSpace.MouseBehaviour  
   MouseX
 �� *PanelWindowX+ �� Mode$ OneWayToSource=�   MouseY �� *PanelWindowY+$ OneWayToSource=�.��� -    �Name$
 grid�� � RowDefinitions �� ���� *GridsHeight+�� $	��15* ��� ���� *GridsHeight+�� ���� *GridsHeight+.+�(� $��1��$��Stretch=�$��Stretch=�z��� *ViewRenderTrasform+y��� *IsMediaVisible+.��r� -    r�Name$ mediaPlayer�� J� OpacityMask
 �   � r� LoadedBehavior$ Manual=� r� UnloadedBehavior$ Manual=�$��2�� r� Volume �� *MediaVolume+ r� Source �� *MediaSource+ r� IsMuted �� *MediaIsMuted+   $ 
MouseWheel��. -  'Prism.Interactivity.InvokeCommandAction     Command �� *MouseWheelCommand+	   
 �� *PanelX+$ OneWayToSource=� �� *PanelY+$ OneWayToSource=�(  "System.Windows.Controls.WebBrowser     Source$ https://www.youtube.com/?�$��1��y��� *IsBrowserVisible+o� $��0��
���   �
���   �
���   �$��Stretch=�y��� *ToolBarVisibility+.@�m� $��Stretch=�$��
Open video��$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800 m� Command �� *	OpenVideo+m� $��Stretch=�$��Open YouTube��$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800 �� *OpenYTVideo+m� $��Stretch=�$��Make screenshot��$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800 �� *MakeScreenshot+m� $��History��$��Stretch=�$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800{��� *HistoryEnabled+���� *	MenuItems+c� $��3��
���   �
���   �
���   �$��Stretch=�y��� *ToolBarVisibility+.@��� ���	#FFFFE800$
��Bold"�$��Right=�$��Center=����� *TimeContent+�� $��70�����	#FF323232$��Stretch=�$
��Bold"����	#FF292929���	#FFFFE800���� *	PlayVideo+.���� $��AVPplay.png���� $��70�����	#FF323232$��Stretch=�$
��Bold"����	#FF292929���	#FFFFE800���� *
PauseVideo+.���� $��AVPpause.png���� $��70�����	#FF323232$��Stretch=�$
��Bold"����	#FF292929���	#FFFFE800���� *	StopVideo+.���� $��AVPstop.png���� $��1q�
���   ��� $��Stretch=�$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800���� *	MuteVideo+���� *MuteContent+�� $��Full Screen��$	��100��$��Stretch=����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800���� *
FullScreen+�� $��Stretch=�$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800���� *
SpeedVideo+���� *SpeedContent+�� $��1q�
���   ��� $��Stretch=�$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800���� *BorderlessMode+���� *
BorderText+�� $��Stretch=�$	��100�����	#FF323232$
��Bold"����	#FF292929���	#FFFFE800���� *	OnTopMode+���� *	OnTopText+�� $��1q�
���   �]� ���	#FF323232.+��� ���	#FFFFE800$�� Volume:   ��$
��Bold"�$��Right=�$��Center=���  �� IsSelectionRangeEnabled .  � SmallChange$ 1Q�$��75��$��Center=�{��� *AudioIsEnabled+ � Value �� *
AudioValue+ � Maximum �� *AudioMaximum+ �� SelectionEnd �� *AudioSelectionEnd+ � 	Resources  �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *&$SystemColors.ControlDarkDarkBrushKey+)�� $ 	#FFFFC500���� $ Silver���� -     ��Name$  sliderVideo��$��2��$��3q� . $ 1Q�$��2��$��Center=� �� *SliderValue+ �� *SliderMaximum+ �� *SliderSelectionEnd+ ��%�   (��       * SystemColors.HighlightBrushKey+)(��      *&$SystemColors.ControlDarkDarkBrushKey+)�� $ 	#FFFFC500���� $ Silver��