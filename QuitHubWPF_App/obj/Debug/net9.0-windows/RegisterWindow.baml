   M S B A M L   `   `   `  ����_  [MaterialDesignThemes.Wpf, Version=5.2.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aeHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf  5   	    QuitHubWPF_App#   QuitHubWPF_App.RegisterWindow   5   	   W SPresentationCore, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   cmaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5   	     � Title$  Register��5   	   $	��620��6   $
��1000��6'    � WindowStartupLocation$ CenterScreen=�64   
������� � 
ResizeMode$ 	CanResize=�5       � 	Resources 5         GreenGradient �� 
StartPoint �� EndPoint � Color � Offset3  -System.Windows.Media.Effects.DropShadowEffect  
DropShadow   ShadowDepth	   Color
   	Direction   Opacity   
BlurRadius��%  &	        &	 �     �� 5	   
   $	 0,0&�64   $	 0,1&�6E   .��5
      � $ #66BB6A��6   $ 0Q�6+   � 5      $ #388E3C��6   $ 1Q�6+   5        5   
   $ 4Q�6.   $
	 Gray��6>   $	
 270Q�6K   $	 0.3Q�5      $ 10Q�6)   5      .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   F� $��2��6   #��[  5       �� Stretch$
 Fill=�65   6���� ʚ;    � �/��� �/�t� ʚ; F�#� ʚ;    	 K� ZIndex$ 0��5      � 5   
   $��0��6   $��40q�6   $��Center=�6+   $��Center=�6F   $ 1��6c   .+�5       �� 
������� �� CornerRadius$ 15��6(    �� Padding$ 30q�6:    J� Effect# [ 5!      $	��400��6:   ._�5"      �� .+�5#      �� $��Register��6    $��24(�60   $
��Bold"�6>   $��0,0,0,20q�6P   �� 5&      $��Username��6    $��0,0,0,5q�60   � 5'      $��0,0,0,15q�6   $��40��6-    5(      �� 5)      $
��Auto �6/   �� 5*      $��* �6/   .+�5,      '   !MaterialDesignThemes.Wpf.PackIcon     Kind$ Account=�62   $��20��6A   $��20��6L   $��Center=�6X   $��0,0,10,0q�5-   2   
�������6D   �� 5.      -   5         ��Name$ txtUsername��5.   "   $��1��67   $��34��6G   $	��300��6S   $��Center=�5/   "   $��5q�6=   50      �� 53      $��Password��6    $��0,0,0,5q�60   � 54      $��0,0,0,15q�6   $��40��6-    55      �� 56      $
��Auto �6/   �� 57      $��* �6/   .+�59        $
 Lock=�62   $��20��6>   $��20��6I   $��Center=�6U   $��0,0,10,0q�5:   2   
�������6D   G� 5;      -   5         G�Name$ txtPassword��5;   &   $��1��6;   $��34��6K   $	��300��6W   $��Center=�5<   &   $��5q�6A   5=      �� 5@      $��Confirm Password��6    $��0,0,0,5q�68   � 5A      $��0,0,0,15q�6   $��40��6-    5B      �� 5C      $
��Auto �6/   �� 5D      $��* �6/   .+�5F        $ 	LockCheck=�62   $��20��6C   $��20��6N   $��Center=�6Z   $��0,0,10,0q�5G   2   
�������6D   G� 5H      -   5        $ txtConfirmPassword��5H   &   $��1��6B   $��34��6R   $	��300��6^   $��Center=�5I   &   $��5q�6A   5J      �� 5M      -   5         ��Name$ btnRegister��5M      $��40��62   $
��Bold"�6>    � Cursor$
 Hand��6P   ��5N      �� 5O      $	 0,0&�62   $	 1,1&�6C   .��5P   "   � $ #43A047��6/   $ 0Q�6?   � 5Q   "   $ #1B5E20��6/   $ 1Q�6?   5R      .��5T      � .+�5V      �� -   5         ��Name$ registerContent��5V   )    �� Orientation$ 
Horizontal=�6B   $��Center=�6[   $��Center=�6x   .+�5W   "     $ AccountPlus=�6:   $��20��6M   $��0,0,10,0q�6X   
�������6j   �� 5X   "   $��Sign up��6,   
�������6;   5Y        5\      -   5          Name$ registerSpinner��5\   6   $ Loading=�6O   $��22��6^   $��22��6i   
�������$y�	Collapsed=�5]   I   $��Center=�5^   6   $��Center=�6S   z�5_   "   �� 5`   &   -   5        spinnerRotate�� �� Angle$ 0Q�5`   M    �� CenterX$ 11Q�6W    �� CenterY$ 11Q�6d   5b      5c      5d      �� 5g      -   5        $��Center=�5g       $��0,10,0,0q�6=   $
 Hand��6O   �� 5h      $�Already have an account? ��6    �� 5i      $�Sign in��6   ���#1B5E20$
��Bold"�6B   5j      �� 5m      -	   5        $
 Hand��5m      $ 10��5n      $	 8,6q�6/   $��0,20,0,0q�6=   #��[  5o      $	��180��6I   $��Center=�5p      ._�5q      �� $ 
Horizontal=�6%   $��Center=�6>   .+�5r        $ 
SmokingOff=�66   $��20��6H   $��20��6S   
�������$��0,0,8,0q�6r   �� 5s      $��View Web Version��6(   
�������$
��Bold"�6S   5t      5u      5v      5w      5x      � 5{   
   $��1��6   $ 1��6   .+�5|      �� $��100,120,50,0q�6   $
��Left=�6/   $	��Top=�6J   $	��400��6b   .+�5}      �� $��Join the journey��6   $��36(�64   $
��Bold"�6B   
�������6T   �� 5~      $^��XSign up to begin your path to a healthier, smoke-free life. We’re here to support you.��6   $��16(�5      
�������$��0,10,0,0q�6=   $
��Wrap=�6O   5�      5�      5�      5�      