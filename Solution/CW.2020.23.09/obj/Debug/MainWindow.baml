   M S B A M L   `   `   `  ����N  JAdvancedVideoPlayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MouseBehaivorSpaceMouseBehaivorSpace  5   	   !    CW._2020._23._09.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:MouseBehaivorSpace     5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3b+http://schemas.microsoft.com/xaml/behaviors  5   	   S OPrism.Wpf, Version=8.0.0.1909, Culture=neutral, PublicKeyToken=40ee6c3a2184dc59'cmdhttp://www.codeplex.com/prism  5   	     � Title$  Advanced Video Player��5
   	   $��90��5   	   $	��120��5   	   
���   � � Icon$ AVPicon16.png��5   	    � WindowStyle 5   	   �� *WindowStyle+ � WindowState 5   	   �� *WindowState+ � Topmost 5   	   �� *TopmostState+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ 
MouseLeave��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *HideAllControls+5        5   
   $ 
MouseEnter��6   . 5         6$   �� *ShowAllControls+5        5   
   $ MouseDoubleClick��6   . 5         6$   �� *DoubleClickFS+5        5   
   $ Closing��6   . 5         6$   �� *	AddInList+5      	   	Behaviors	 5!      '   !MouseBehaivorSpace.MouseBehaviour  5"   
   
   MouseX
 6   �� *PanelWindowX+ �� Mode$ OneWayToSource=�   MouseY 6T   �� *PanelWindowY+$ OneWayToSource=�.��5%      � -   5         �Name$
 grid��5%       � RowDefinitions 5&   
   �� 5'      ��6   �� *MenuGridHeight+6@   �� 5(      $	��20* �6   6+   �� 5)      ��6   �� *GridsHeight+6=   �� 5*      ��6   �� *GridsHeight+6=   .+�5-   
   (� $��1��6   $��Stretch=�6�   $��Stretch=�6�   z�6   �� *ViewRenderTrasform+y�6N   �� *IsMediaVisible+$ OneWay=�.��5.      r� -   5         r�Name$ mediaPlayer��5.       J� OpacityMask
 �   � r� LoadedBehavior$ Manual=�6D    r� UnloadedBehavior$ Manual=�6\   $��2��6v    r� Volume 6�   �� *MediaVolume+ r� Source 6�   �� *MediaSource+ r� IsMuted 6�   �� *MediaIsMuted+6�    5/        50      $ 
MouseWheel��6!   . 51      -  'Prism.Interactivity.InvokeCommandAction     Command 6.   �� *MouseWheelCommand+52      	 54        55      
 6'   �� *PanelX+$ OneWayToSource=� 6V   �� *PanelY+$ OneWayToSource=�57      (  "System.Windows.Controls.WebBrowser  59   
   -   5          Name$ browser��59      $��1��6&   y�63   �� *IsBrowserVisible+$ OneWay=�6j   o� 5=   
   $��0��68   
���   �
���   �$��Stretch=�6l   y�6   �� *ToolBarVisibility+��5>      �� 5?       �� Opacity$	 0.0Q�6"   .@�5A      m� $��Stretch=�65   $��
Open video��6Q   $	��100��6e   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 m� Command 6   �� *	OpenVideo+6�   m� 5B      $��Stretch=�67   $��Open YouTube��6S   $	��100��6i   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *OpenYTVideo+6�   m� 5C      $��Stretch=�6:   $��Make screenshot��6V   $	��100��6o   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *MakeScreenshot+6�   m� 5D      $��History��6   $��Stretch=�6M   $	��100��6�   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800{�6(   �� *HistoryEnabled+��6i   �� *	MenuItems+6�   m� 5E      $��Stretch=�6X   $	��100��6t   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *BorderlessMode+��6:   �� *
BorderText+6�   m� 5F      $��Stretch=�6R   $	��100��6n   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800 6   �� *	OnTopMode+��65   �� *	OnTopText+6�   5G      c� 5H   
   $��3��6;   
���   �
���   �
���   �$��Stretch=�6�   y�6   �� *ToolBarVisibility+.@�5I      �� ���	#FFFFE800$
��Bold"�6K   $��Right=�6]   $��Center=�6y   ��6+   �� *TimeContent+6y   �� 5J      $��70��63   ���	#FF323232$��Stretch=�6Y   $
��Bold"�6u   ���	#FF292929���	#FFFFE800��6   �� *	PlayVideo+.��5K      �� $��AVPplay.png��6   60   5L      �� 5M      $��70��64   ���	#FF323232$��Stretch=�6Z   $
��Bold"�6v   ���	#FF292929���	#FFFFE800��6   �� *
PauseVideo+.��5N      �� $��AVPpause.png��6   61   5O      �� 5P      $��70��63   ���	#FF323232$��Stretch=�6Y   $
��Bold"�6u   ���	#FF292929���	#FFFFE800��6   �� *	StopVideo+.��5Q      �� $��AVPstop.png��6   60   5R      �� 5S      $��1q�6   
���   �68   �� 5T      $��Stretch=�6S   $	��100��6o   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *	MuteVideo+��63   �� *MuteContent+6�   �� 5U      $��Full Screen��64   $	��100��6J   $��Stretch=�6Y   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *
FullScreen+6�   �� 5V      $��Stretch=�6U   $	��100��6q   ���	#FF323232$
��Bold"�6�   ���	#FF292929���	#FFFFE800��6   �� *
SpeedVideo+��64   �� *SpeedContent+6�   �� 5W      $��1q�6   
���   �68   ]� 5X      ���	#FF323232.+�5Y      �� ���	#FFFFE800$�� Volume:   ��6/   $
��Bold"�6E   $��Right=�6W   $��Center=�6s   �� 5Z       �� IsSelectionRangeEnabled .  � SmallChange$ 1Q�6�   $��75��6�   $��Center=�6�   {�6   �� *AudioIsEnabled+ � Value 6?   �� *
AudioValue+ � Maximum 6\   �� *AudioMaximum+ �� SelectionEnd 6}   �� *AudioSelectionEnd+ � 	Resources 5[        �� Color��%�   (��       5\   *   * SystemColors.HighlightBrushKey+)(�� #     5]   *   *&$SystemColors.ControlDarkDarkBrushKey+)�� 5\      $  	#FFFFC500��6\   �� 5]      $  Silver��6b   5^      5_      5`      5a      �� 5b   
   -   5        ! ��Name$! sliderVideo��5b      $��2��6D   $��3q�6Q    . $ 1Q�6{   $��2��6�   $��Center=�6�    6&   �� *SliderValue+ 6�   �� *SliderMaximum+ 6�   �� *SliderSelectionEnd+ 5c      ��%�   (��       5d   "   * SystemColors.HighlightBrushKey+)(�� #     5e   "   *&$SystemColors.ControlDarkDarkBrushKey+)�� 5d      $  	#FFFFC500��6T   �� 5e      $  Silver��6Z   5f      5g      5h      5i      