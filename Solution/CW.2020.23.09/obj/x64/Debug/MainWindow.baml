   M S B A M L   `   `   `  ����N  JAdvancedVideoPlayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MouseBehaivorSpaceMouseBehaivorSpace  5   	   V RCefSharp.Wpf, Version=86.0.241.0, Culture=neutral, PublicKeyToken=40c4b6fc221f4138A0clr-namespace:CefSharp.Wpf;assembly=CefSharp.WpfCefSharp.Wpf 5	   	   !    CW._2020._23._09.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:MouseBehaivorSpace     5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3b+http://schemas.microsoft.com/xaml/behaviors  5   	   S OPrism.Wpf, Version=8.0.0.1909, Culture=neutral, PublicKeyToken=40ee6c3a2184dc59'cmdhttp://www.codeplex.com/prism  5   	   ?cefSharp0clr-namespace:CefSharp.Wpf;assembly=CefSharp.Wpf  5	   	     � Title$  Advanced Video Player��5   	   $��90��5   	   $	��120��5   	   
���   � � Icon$ AVPicon16.png��5   	    � WindowStyle 5   	   �� *WindowStyle+ � WindowState 5   	   �� *WindowState+ � Topmost 5   	   �� *TopmostState+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ 
MouseLeave��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *HideAllControls+5        5   
   $ 
MouseEnter��6   . 5         6$   �� *ShowAllControls+5        5   
   $ MouseDoubleClick��6   . 5         6$   �� *DoubleClickFS+5        5   
   $ Closing��6   . 5          6$   �� *	AddInList+5!      	   	Behaviors	 5#      '   !MouseBehaivorSpace.MouseBehaviour  5$   
   
   MouseX
 6   �� *PanelWindowX+ �� Mode$ OneWayToSource=�   MouseY 6T   �� *PanelWindowY+$ OneWayToSource=�.��5'      �  � RowDefinitions 5(   
   �� 5)      ��6   �� *MenuGridHeight+6@   �� 5*      $	��20* �6   6+   �� 5+      ��6   �� *GridsHeight+6=   �� 5,      ��6   �� *GridsHeight+6=   .+�5/   
   (� $��1��6   $��Stretch=�6�   $��Stretch=�6�   z�6   �� *ViewRenderTrasform+y�6N   �� *IsMediaVisible+$ OneWay=�.��50      r� -   5         r�Name$ mediaPlayer��50       J� OpacityMask
 �   � r� LoadedBehavior$ Manual=�6D    r� UnloadedBehavior$ Manual=�6\   $��2��6v    r� Volume 6�   �� *MediaVolume+ r� Source 6�   �� *MediaSource+ r� IsMuted 6�   �� *MediaIsMuted+6�    51        52      $ 
MouseWheel��6!   . 53      -  'Prism.Interactivity.InvokeCommandAction     Command 6.   �� *MouseWheelCommand+54      	 56        57      
 6'   �� *PanelX+$ OneWayToSource=� 6V   �� *PanelY+$ OneWayToSource=�59      %  CefSharp.Wpf.ChromiumWebBrowser  5;   
   -   5          Name$ ChromiumWebBrowser��5;   '   $��1��6s   $��Stretch=�6�   $��Stretch=�6�      Address 6C   �� *BrowserAddress+$ OneWay=�y�6�   �� *IsBrowserVisible+$ OneWay=�6�   o� 5=   
   $��0��6   
���   �
���   �$��Stretch=�6C   ��5>      �� 5?       �� Opacity$	 0.0Q�6"   .@�5A      m� $��Stretch=�65   $��
Open video��6Q   $	��100��6e   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 m� Command 6   �� *	OpenVideo+6�   m� 5B      $��Stretch=�6   $	��100��63   ���	#FF323232$
��Bold"�6Y   ���	#FF292929���	#FFFFE800��5C      �� 5D      Open video from �� 5E   *   
���  ��.�6@   You6E   �� 6K   
�������.�6c   Tube6i   5F      .@�5H      ��  �� Orientation$ Vertical=�6   .+�5I      �� $��
Enter URL:��6   63   �� 5J      $��Stretch=�6   ��6<   �� *UrlYT+6U   �� 5K      $	��200��6=   $��Stretch=�6I   $��Open video from YouTube��6e   $	��100��6�   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *OpenYTVideo+6�   5L      5M      m� 5N      $��Stretch=�6:   $��Make screenshot��6V   $	��100��6o   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *MakeScreenshot+6�   m� 5O      $��History��6   $��Stretch=�6M   $	��100��6�   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800{�6(   �� *HistoryEnabled+��6i   �� *	MenuItems+6�   m� 5P      $��Stretch=�6X   $	��100��6t   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *BorderlessMode+��6:   �� *
BorderText+6�   m� 5Q      $��Stretch=�6R   $	��100��6n   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *	OnTopMode+��65   �� *	OnTopText+6�   m� 5R      $��Full Screen��66   $	��100��6K   $��Stretch=�6Z   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *
FullScreen+6�   5S      c� 5U   
   $��3��6;   
���   �
���   �
���   �$��Stretch=�6�   y�6   �� *ToolBarVisibility+.@�5V      �� ���	#FFFFE800$
��Bold"�6K   $��Right=�6]   $��Center=�6y   ��6+   �� *TimeContent+6y   �� 5W      $��70��63   ���	#FF323232$��Stretch=�6Y   $
��Bold"�6u   ���	#FF292929���	#FFFFE800��6   �� *	PlayVideo+.��5X      �� $��AVPplay.png��6   60   5Y      �� 5Z      $��70��64   ���	#FF323232$��Stretch=�6Z   $
��Bold"�6v   ���	#FF292929���	#FFFFE800��6   �� *
PauseVideo+.��5[      �� $��AVPpause.png��6   61   5\      �� 5]      $��70��63   ���	#FF323232$��Stretch=�6Y   $
��Bold"�6u   ���	#FF292929���	#FFFFE800��6   �� *	StopVideo+.��5^      �� $��AVPstop.png��6   60   5_      �� 5`      $��1q�6   
���   �68   �� 5a      $��Stretch=�6S   $	��100��6o   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *	MuteVideo+��63   �� *MuteContent+6�   �� 5b      $��Full Screen��64   $	��100��6J   $��Stretch=�6Y   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *
FullScreen+6�   �� 5c      $��Stretch=�6U   $	��100��6q   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *
SpeedVideo+��64   �� *SpeedContent+6�   �� 5d      $��1q�6   
���   �68   ]� 5e      ���	#FF323232.+�5f      �� ���	#FFFFE800$�� Volume:   ��6/   $
��Bold"�6E   $��Right=�6W   $��Center=�6s   �� 5g       �� IsSelectionRangeEnabled .  � SmallChange$ 1Q�6�   $��75��6�   $��Center=�6�   {�6   �� *AudioIsEnabled+ � Value 6?   �� *
AudioValue+ � Maximum 6\   �� *AudioMaximum+ �� SelectionEnd 6}   �� *AudioSelectionEnd+  � 	Resources  5h      ! �� Color��%�   (��       5i   *   * SystemColors.HighlightBrushKey+)(�� #     5j   *   *&$SystemColors.ControlDarkDarkBrushKey+)�� 5i      $! 	#FFFFC500��6\   �� 5j      $! Silver��6b   5k      5l      5m      5n      �� 5p   
   -   5        " ��Name$" sliderVideo��5p      $��2��6D   $��3q�6Q    . $ 1Q�6{   $��2��6�   $��Center=�6�    6&   �� *SliderValue+ 6�   �� *SliderMaximum+ 6�   �� *SliderSelectionEnd+  5q      ��%�   (��       5r   "   * SystemColors.HighlightBrushKey+)(�� #     5s   "   *&$SystemColors.ControlDarkDarkBrushKey+)�� 5r      $! 	#FFFFC500��6T   �� 5s      $! Silver��6Z   5t      5u      5v      5w      