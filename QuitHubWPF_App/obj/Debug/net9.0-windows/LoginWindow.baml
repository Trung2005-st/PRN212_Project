   M S B A M L   `   `   `  ����_  [MaterialDesignThemes.Wpf, Version=5.2.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aeHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf  5   	    QuitHubWPF_App    QuitHubWPF_App.LoginWindow   5   	   W SPresentationCore, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   cmaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5   	     � Title$  Login��5   	   $	��565��6   $
��1000��6$    � WindowStartupLocation$ CenterScreen=�61   
������� � 
ResizeMode$ 	CanResize=�5   	    � 	Resources 5	         GreenGradient �� 
StartPoint �� EndPoint � Color � Offset3  -System.Windows.Media.Effects.DropShadowEffect  
DropShadow   ShadowDepth	   Color
   	Direction   Opacity   
BlurRadius��%  &	        &	 �     �� 5   
   $	 0,0&�64   $	 0,1&�6E   .��5      � $ #66BB6A��6   $ 0Q�6+   � 5      $ #388E3C��6   $ 1Q�6+   5        5   
   $ 4Q�6.   $
	 Gray��6>   $	
 270Q�6K   $	 0.3Q�5      $ 10Q�6)   5      .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   F� -   5         F�Name$ WelcomeCurve��5      $��2��6%   #��[  5       �� Stretch$
 Fill=�65   ;����        � �� �� �� e� F�#�     F�#�        	 K� ZIndex$ 0��5      � 5"   
   $��0��6   $ 1��6   .+�5#      �� $��50,100,50,0q�6   $
��Left=�6.   $	��Top=�6I   $	��400��6a   .+�5$      �� $��Welcome back��6   $��36(�60   $
��Bold"�6>   
�������6P   �� 5%      $h��bEmpower yourself to quit smoking. Stay consistent, follow your plan, and celebrate each milestone.��6   $��16(�5&      
�������$��0,10,0,0q�6=   $
��Wrap=�6O   5'      5(      � 5+   
   $��1��6   $��40q�6   $��Center=�6+   $��Center=�6F   .+�5,      �� 
������� �� CornerRadius$ 15��6(    �� Padding$ 30q�6:    J� Effect# [ 5-      $	��400��6:   ._�5.      �� .+�5/      �� $��Login��6    $��24(�6-   $
��Bold"�6;   $��0,0,0,20q�6M   �� 52      $��Username��6    $��0,0,0,5q�60   � 53      $��0,0,0,15q�6   $��40��6-    54      �� 55      $
��Auto �6/   �� 56      $��* �6/   .+�58      '   !MaterialDesignThemes.Wpf.PackIcon     Kind$ Account=�62   $��20��6A   $��20��6L   $��Center=�6X   $��0,0,10,0q�59   2   
�������6D   �� 5:      -   5         ��Name$ txtUsername��5:   "   $��1��67   $��34��6G   $	��300��6S   $��Center=�5;   "   $��5q�6=   5<      �� 5?      $��Password��6    $��0,0,0,5q�60   � 5@      $��0,0,0,15q�6   $��40��6-    5A      �� 5B      $
��Auto �6/   �� 5C      $��* �6/   .+�5E        $
 Lock=�62   $��20��6>   $��20��6I   $��Center=�6U   $��0,0,10,0q�5F   2   
�������6D   G� 5G      -   5         G�Name$ txtPassword��5G   &   $��1��6;   $��34��6K   $	��300��6W   $��Center=�5H   &   $��5q�6A   5I      �� 5L      -   5         ��Name$ remember_clicked��5L      $��Remember me��69   $��0,0,0,15q�6O   �� 5O      -   5         ��Name$ btnLogin��5O      $��40��6/   $
��Bold"�6;    � Cursor$
 Hand��6M   ��5P      �� 5Q      $	 0,0&�62   $	 1,1&�6C   .��5R   "   � $ #43A047��6/   $ 0Q�6?   � 5S   "   $ #1B5E20��6/   $ 1Q�6?   5T      .��5V      � .+�5X      �� -   5         ��Name$ loginContent��5X   )    �� Orientation$ 
Horizontal=�6?   $��Center=�6X   $��Center=�6u   .+�5Y   "     $ Login=�6:   $��20��6G   $��0,0,10,0q�6R   
�������6d   �� 5Z   "   $��Sign in��6,   
�������6;   5[        5^      -   5          Name$ loginSpinner��5^   6   $ Loading=�6L   $��22��6[   $��22��6f   
�������$y�	Collapsed=�5_   I   $��Center=�5`   6   $��Center=�6S   z�5a   "   �� 5b   &   -   5        spinnerRotate�� �� Angle$ 0Q�5b   M    �� CenterX$ 11Q�6W    �� CenterY$ 11Q�6d   5d      5e      5f      �� 5i      -	   5        $��Center=�5i       $��0,10,0,0q�6=   $
 Hand��6O   �� 5j      $�Don't have an account? ��6    �� 5k      $�Register now��6   ���#1B5E20$
��Bold"�6G   5l      �� 5o      -
   5        $
 Hand��5o      $ 10��5p      $	 8,6q�6/   $��0,20,0,0q�6=   #��[  5q      $	��180��6I   $��Center=�5r      ._�5s      �� $ 
Horizontal=�6%   $��Center=�6>   .+�5t        $ 
SmokingOff=�66   $��20��6H   $��20��6S   
�������$��0,0,8,0q�6r   �� 5u      $��View Web Version��6(   
�������$
��Bold"�6S   5v      5w      5x      5y      5z      5{      5|      