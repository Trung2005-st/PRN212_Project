   M S B A M L   `   `   `  ����  QuitHubWPF_App     QuitHubWPF_App.AdminWindow   5   	   W SPresentationCore, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  AdminWindow��5   	   $	��600��6   $
��1000��6*    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ 	CanResize=�5   	    � 	Resources 5         GreenGradient �� 
StartPoint �� EndPoint � Color � Offset  AdminCardStyle �� 
TargetType	 �� Property
 �� Value3  -System.Windows.Media.Effects.DropShadowEffect   Color   
BlurRadius   ShadowDepth   Opacity �� Triggers P� Property P� Value��%�  &	        &	 �     �� 5	   
   $	 0,0&�64   $	 1,1&�6E   .��5
      � $ #66BB6A��6   $ 0Q�6+   � 5      $ #388E3C��6   $ 1Q�6+   5      �� 5   
   " ��6'   .�5      �� 	 � ��$
 20q�6'   �� 5      	 �@��Padding$
 20q�6(   �� 5      	 �@��CornerRadius$
 10��6-   �� 5      	 � ��
 �#388E3C6,   �� 5      	 � ��$
 2q�60   �� 5      	 � ��

 �����6+   �� 5      	 �@�Cursor$

 Hand��6'   �� 5      	 �@J�Effect
 5        5      $ Black��6'   $ 0Q�65   $ 0Q�6D   $ 0Q�6T   5      �� 5      	 � ��
 �#2E7D3265   �� 5      	 � ��$

 Bold"�65    5      P� 5       �@J�IsMouseOver$
 True��61   . �5      �� 	 � ��
 �#C8E6C963   �� 5       	 � ��

 �����6=   �� 5!      	 � ��$

 Bold"�6=   �� 5"      	 �@J�Effect
 5#        5$      $ Black��6/   $ 10Q�6=   $ 2Q�6M   $	 0.2Q�6]   5&      5'      5)      5*      .��5,      � ��5.   
   �� 5/       �� ImageSource$= 7pack://application:,,,/Assets/Images/backgroundImg1.png��6    j� Stretch$
 Fill=�6_   .+�53   
   ]� .+�56      ]� $	��Top=�6   #��[  6-   $��50��6Y   $��False��6e   .+�57      �� -   5         ��Name$ welcomeText��57      $��Welcome, Admin��58      
�������$
��Bold"�5:      $��16(�5;      $��Center=�5<      $��20,0,0,0q�5=      �� 5?      -   5        $��Logout��5?      
���  ��
�������$
��Bold"�5C      $��80��5D      $��30��5E      $��0,0,20,0q�5F      $��Right=�5G      $��Center=�5H      $��0q�5I      $��Right=�5J      5K      � 5N      $��40q�6   $��Center=�6$   $	��Top=�6A   .+�5O      �� #��[ 6   $	��200��6A   $	��120��6M   ._�5P      �� $��Manage Users��6    $��Center=�64   $��Center=�6Q   5Q      �� 5R      #��[ 6   $	��200��6A   $	��120��6M   ._�5S      �� $��Manage Plans��6    $��Center=�64   $��Center=�6Q   5T      �� 5U      #��[ 6   $	��200��6A   $	��120��6M   ._�5V      �� $��Manage Feedback��6    $��Center=�67   $��Center=�6T   5W      �� 5X      #��[ 6   $	��200��6A   $	��120��6M   ._�5Y      �� $��Reports & Analytics��6    $��Center=�6?   $��Center=�6\   5Z      5[      5\      5]      5^      